require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('aa_questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Users
  attr_accessor :id, :fname, :lname

  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        users;
    SQL
    data.map do |row|
      Users.new(row)
    end
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def save
    if @id
      #update
      QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
        UPDATE
          users
        SET
          fname = ?, lname = ?
        WHERE
          id = ?;
      SQL
    else
      #insert
      QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
        INSERT INTO
          users (fname, lname)
        VALUES
          (?, ?);
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    end
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    Users.new(data.first)
  end

  def self.find_by_name(fname, lname)
    data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    data.map { |datum| Users.new(datum) }
  end

  def authored_questions
    Questions.find_by_author_id(@id)
  end

  def authored_replies
    Replies.find_by_replier_id(@id)
  end

  def followed_questions
    QuestionFollows.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLikes.liked_questions_for_user_id(@id)
  end

  def average_karma
    #find all questions that the user has
    #find like-count for each of those questions
    #find average of those likes
    all_questions_for_this_user = Questions.find_by_author_id(@id)

    num_likes_per_q = all_questions_for_this_user.map do |question|
      QuestionLikes.num_likes_for_question_id(question.id)
    end

    num_likes_per_q.reduce(:+) / num_likes_per_q.length.to_f
  end
end

class Questions
  attr_accessor :id, :title, :body, :author_id

  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        questions;
    SQL
    data.map do |row|
    Questions.new(row)
    end
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def self.find_by_id(id) #returns object
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    Questions.new(data.first)
  end

  def self.find_by_author_id(author_id) #returns array
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    data.map { |datum| Questions.new(datum) }
  end

  def author
    Users.find_by_id(@author_id)
  end

  def replies
    Replies.find_by_question_id(@id)
  end

  def followers
    QuestionFollows.followers_for_question_id(@id)
  end

  def most_followed(n)
    QuestionFollows.most_followed_questions(n)
  end

  def likers
    QuestionLikes.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLikes.num_likes_for_question_id(@id)
  end

  def self.most_liked(n)
    QuestionLikes.most_liked_questions(n)
  end

end

class QuestionFollows
  attr_accessor :question_id, :user_id

  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        question_follows;
    SQL
    data.map do |row|
    QuestionFollows.new(row)
    end
  end

  def initialize(options)
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_follows
      JOIN
        users ON users.id = user_id
      WHERE
        question_id = ?
    SQL
    data.map { |datum| Users.new(datum) }
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows
      JOIN
        questions ON question_id = questions.id
      WHERE
        user_id = ?
    SQL
    data.map { |datum| Questions.new(datum) }
  end

  def self.most_followed_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        title, COUNT (title) AS count
      FROM
        questions
      JOIN
        question_follows
        ON questions.id = question_id
      GROUP BY
        title
      ORDER BY
        count DESC
      LIMIT
        ?
    SQL
    data.map { |datum| Questions.new(datum) }
  end

end

class QuestionLikes
  attr_accessor :question_id, :user_id

  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        question_likes;
    SQL
    data.map do |row|
    QuestionLikes.new(row)
    end
  end

  def initialize(options)
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

  def self.likers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        id, fname, lname
      FROM
        question_likes
      JOIN
        users
        ON user_id = users.id
      WHERE
        question_id = ?
    SQL
    data.map { |datum| Users.new(datum) }
  end

  def self.num_likes_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT (user_id)
      FROM
        question_likes
      WHERE
        question_id = ?
      GROUP BY
        question_id
    SQL
    data.first.values.first
  end

  def self.liked_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_likes
      JOIN
        questions
        ON question_id = questions.id
      WHERE
        user_id = ?
    SQL
    data.map { |datum| Questions.new(datum) }
  end

  def self.most_liked_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        questions
      JOIN
        question_likes
        ON questions.id = question_id
      GROUP BY
        title
      ORDER BY
        COUNT (title) DESC
      LIMIT
        ?
    SQL
    data.map { |datum| Questions.new(datum) }
  end
end

class Replies
    attr_accessor :id, :question_id, :parent_reply, :replier_id, :body

  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        replies;
    SQL
    data.map do |row|
    Replies.new(row)
    end
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_reply = options['parent_reply']
    @replier_id = options['replier_id']
    @body = options['body']
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    Replies.new(data.first)
  end

  def self.find_by_replier_id(replier_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, replier_id)
      SELECT
        *
      FROM
        replies
      WHERE
        replier_id = ?
    SQL
    data.map { |datum| Replies.new(datum) }
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    data.map {|datum| Replies.new(datum)}
  end

  def author
    data = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        users.id, fname, lname
      FROM
        replies
      JOIN
        users ON users.id = replier_id
      WHERE
        replies.id = ?
    SQL
    Users.new(data.first)
  end

  def question
    Questions.find_by_id(@question_id)
  end

  def parent_reply
    raise "this is parent reply" unless @parent_reply
    Replies.find_by_id(@parent_reply)
  end

  def child_replies
    data = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply = ?
    SQL
    data.map {|datum| Replies.new(datum)}
  end



end












#
