require 'byebug'

class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    boss.employee << self if @boss
  end

  def bonus(multiplier)
    salary * multiplier
  end

end

class Manager < Employee
  attr_accessor :employee
  def initialize(name, title, salary, boss)
    @employee = []
    super
  end

  def bonus(multiplier)
    sum = 0
    employee.each do |person|
      if person.is_a?(Manager)
        sum += person.bonus(multiplier)
        sum += person.salary * multiplier
      else
        sum += person.salary * multiplier
      end
    end
    sum
  end

end

ned = Manager.new("Ned", "Founder", 1_000_000, nil)
darren = Manager.new("Darren", "TA Manager", 78_000, ned)
shawna = Employee.new("Shawna", "TA", 12_000, darren)
david = Employee.new("David", "TA", 10_000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
