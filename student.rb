require_relative 'person'
require_relative 'classroom'

class Student < Person
  def initialize(age, name, parent_permission: true, id: Random.rand(1..1000))
    super(age, name, parent_permission: parent_permission, id: id)
    @classroom = nil
  end

  attr_accessor :classroom

  def set_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
