require 'rspec'
require_relative '../nameable'
require_relative '../decorator'

describe Decorator do
  let(:nameable) { Nameable.new }
  let(:person) { Person.new(21, 'John', 123) }
  subject { Decorator.new(nameable) }

  describe '#initialize' do
    it 'sets the @nameable instance variable' do
      expect(subject.instance_variable_get(:@nameable)).to eq(nameable)
    end
  end

  describe '#correct_name' do
    it 'calls the correct_name method on the @nameable instance variable' do
      expect(nameable).to receive(:correct_name)
      subject.correct_name
    end
  end

  it 'correct_name for Capitalize' do
    newperson = Person.new(21, 'john')
    capitalizer = CapitalizeDecorator.new(newperson)
    expect(capitalizer.correct_name).to eq('John')
  end

  it 'correct_name for Trimmer' do
    newperson = Person.new(21, 'johnoooooooooooooooo')
    trimmer = TrimmerDecorator.new(newperson)
    expect(trimmer.correct_name).to eq('johnoooooo')
  end
end
