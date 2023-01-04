require 'rspec'
require_relative '../person'
require_relative '../nameable'

describe Person do
  let(:person) { Person.new(21, 'John', 123) }
  let(:rental) { double('rental') }

  describe '#initialize' do
    it 'creates a new Person object with the given age and name' do
      expect(person).to be_a(Person)
      expect(person.age).to eq(21)
      expect(person.name).to eq('John')
    end

    it 'creates a new Person object with a random id if no id is provided' do
      random_person = Person.new(21, 'Jane')
      expect(random_person.id).to be_a(Integer)
    end

    it 'creates a new Person object with the given id if provided' do
      expect(person.id).to eq(123)
    end

    it 'creates a new Person object with parent_permission set to true by default' do
      expect(person.instance_variable_get(:@parent_permission)).to eq(true)
    end
  end

  describe '#correct_name' do
    it 'returns the correct name of the person' do
      expect(person.correct_name).to eq('John')
    end
  end
end
