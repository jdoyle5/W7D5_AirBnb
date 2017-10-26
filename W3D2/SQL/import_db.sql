

CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT,
  author_id INTEGER NOT NULL,
  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id VARCHAR(255),
  parent_reply INTEGER,
  replier_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply) REFERENCES replies(id),
  FOREIGN KEY (replier_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  question_id INTEGER,
  user_id INTEGER,
  FOREIGN KEY (question_id) REFERENCES quesions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Angel', 'Velasco'),
  ('Max', 'Tocarev'),
  ('Brittney', 'Spears'),
  ('James', 'Bond');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Code Review', 'Can you check our code?', 1),
  ('Lost Memory', 'What day is it?', 3),
  ('MI6', 'Who set us up?', 4),
  ('Lunchtime', 'What time is lunch?', 2),
  ('President', 'Who''s our president?', 3);

INSERT INTO
  question_follows (question_id, user_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 2),
  (5, 3);

INSERT INTO
  question_likes (question_id, user_id)
VALUES
  (3, 1),
  (4, 1),
  (2, 4),
  (5, 4),
  (5, 3),
  (5, 2);

INSERT INTO
  replies (question_id, parent_reply, replier_id, body)
VALUES
  (1, NULL, 2, 'Sure what time?'),
  (1, 1, 1, 'Now?'),
  (1, 1, 4, 'I can do now'),
  (3, NULL, 3, 'Ooops! I did it again.'),
  (3, 4, 2, 'Oh you guys are cute.'),
  (1, 1, 3, 'I''ll check for you guys!'),
  (2, Null, 1, 'Max wake up!'),
  (2, 7, 2, 'The barley tea''s not kicking in!');
