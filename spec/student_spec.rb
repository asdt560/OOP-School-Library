require 'rspec'
require_relative '../student'
require_relative '../person'
require_relative '../classroom'

describe Student do
  let(:student) { Student.new(10, 'Classroom 1', 'John') }
  let(:classroom) { double('Classroom') }

  it 'is a Person' do
    expect(student).to be_a(Person)
  end

  it 'has a classroom' do
    expect(student.classroom).to eq('Classroom 1')
  end

  it 'can change its classroom' do
    student.classroom = 'Classroom 2'
    expect(student.classroom).to eq('Classroom 2')
  end

  it 'can add itself to a classroom' do
    allow(classroom).to receive(:students).and_return([])
    expect(classroom).to receive(:students).and_return([student])
    student.add_classroom(classroom)
  end

  it 'can play hooky' do
    expect(student.play_hooky).to eq('¯\(ツ)/¯')
  end
end
