require_relative 'person'
require_relative 'classroom'

class Student < Person
  def initialize(age, classroom, name, id: Random.rand(1..1000), parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
    @classroom = classroom
  end

  attr_accessor :classroom, :parent_permission

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
