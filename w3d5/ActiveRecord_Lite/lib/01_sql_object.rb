require 'byebug'
require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    @columns ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL
    @columns[0].map(&:to_sym)
  end

  def self.finalize!
    columns.each do |col|
      define_method(col) do
        attributes[col]
      end

      define_method("#{col}=") do |value|
        attributes[col] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end

  def self.all
    all = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL
    parse_all(all)
  end

  def self.parse_all(results)
    results.map do |result|
      self.new(result)
    end
  end

  def self.find(id)
    all = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
      #{table_name}.id = #{id}
    SQL
    parse_all(all).first
  end

  def initialize(params = {})
    columns = self.class.columns

    params.each do |attribute, value|
      attribute = attribute.to_sym

      if columns.include?(attribute)
        self.send("#{attribute}=", value)
      else
        raise "unknown attribute '#{attribute}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map do |attr_name|
      self.send(attr_name)
    end
  end

  def insert
    columns = self.class.columns
    col_names = columns.map(&:to_s).join(", ")
    question_marks = (["?"] * columns.length).join(", ")

    attr_values = attribute_values
    DBConnection.execute(<<-SQL, *attr_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    columns = self.class.columns
    columns = columns.map { |col| "#{col} = ?" }
    columns = columns.join(", ")

    DBConnection.execute(<<-SQL, *attribute_values)
      UPDATE
        #{self.class.table_name}
      SET
        #{columns}
      WHERE
        #{self.class.table_name}.id = #{self.id}
    SQL

  end

  def save
    if self.id
      update
    else
      insert
    end
  end
end
