require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @column_names if @column_names

    all_rows = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL

    @column_names = all_rows[0].map(&:to_sym)
  end

  def self.finalize!
    columns.each do |col|
      define_method(col) { self.attributes[col] }
      define_method("#{col}=") do |value|
        self.attributes[col] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    "#{self.name.downcase}s"
  end

  def self.all
    all_records = DBConnection.execute(<<-SQL)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
    SQL

    self.parse_all(all_records)
  end

  def self.parse_all(results)
    results.map do |row|
      self.new(row)
    end
  end

  def self.find(id)
    found = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        id = ?
      LIMIT
        1
    SQL

    found.empty? ? nil : self.parse_all(found).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map do |col|
      self.send("#{col}")
    end
  end

  def insert
    col_names = self.class.columns.drop(1)
    col_names = col_names.join(",")
    question_marks = (["?"] * self.class.columns[1..-1].length).join(",")
    vals = self.attribute_values.drop(1)

    DBConnection.execute(<<-SQL, *vals)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    col_names = self.class.columns.drop(1)
    col_names = col_names.map { |name| "#{name} = ?" }.join(",")
    update_id = self.id
    vals = self.attribute_values.drop(1)

    DBConnection.execute(<<-SQL, *vals, update_id)
      UPDATE
        #{self.class.table_name}
      SET
        #{col_names}
      WHERE
        id = ?
    SQL
  end

  def save
    id.nil? ? insert : update
  end
end
