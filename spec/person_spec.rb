require 'rspec'
require_relative '../person'
require_relative '../book'
require_relative '../rental'
require_relative '../nameable'

describe Person do
  let(:person) { Person.new(21, 'John', 123) }
  let(:book) { Book.new('To Kill a Mockingbird', 'Harper Lee') }
  let(:rental) { Rental.new('01', book, person, id: 123) }

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

  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      expect(person.can_use_services?).to eq(true)
    end

    it 'returns true if the person has parent permission' do
      minor_person = Person.new(17, 'Jane', 456, parent_permission: true)
      expect(minor_person.can_use_services?).to eq(true)
    end

    it 'returns false if the person is not of age and does not have parent permission' do
      minor_person = Person.new(17, 'Jane', 456, parent_permission: false)
      expect(minor_person.can_use_services?).to eq(false)
    end
  end

  describe '#of_age?' do
    it 'returns true if age is 18 or more' do
      expect(person.of_age?).to eq(true)
    end

    it 'returns false if age is below 18' do
      minor_person = Person.new(17, 'Jane', 456, parent_permission: false)
      expect(minor_person.of_age?).to eq(false)
    end
  end

  describe '#correct_name' do
    it 'returns the correct name of the person' do
      expect(person.correct_name).to eq('John')
    end
  end

  describe '#add_rental' do
    it 'adds the rental to the person\'s rentals' do
      puts person.rentals
      person.add_rental(rental)
      expect(person.rentals).to include(rental)
    end
  end
end
