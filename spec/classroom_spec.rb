require 'rspec'
require_relative '../classroom'
require_relative '../student'

describe Classroom do
  describe '#initialize' do
    it 'sets the label attribute' do
      classroom = Classroom.new('1A')
      expect(classroom.label).to eq('1A')
    end

    it 'initializes the students array' do
      classroom = Classroom.new('1A')
      expect(classroom.students).to eq([])
    end
  end

  describe '#add_student' do
    it 'adds a student to the students array' do
      classroom = Classroom.new('1A')
      student = Student.new(21, 'John', 123)
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end
