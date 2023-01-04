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
end
