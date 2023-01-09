require 'rspec'
require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
  describe '#initialize' do
    it 'creates a new rental with a given date, book, person, and id' do
      book = Book.new('To Kill a Mockingbird', 'Harper Lee')
      person = Person.new(21, 'John', 123)
      rental = Rental.new('01', book, person, id: 123)

      expect(rental.date).to eq('01')
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(rental.id).to eq(123)
    end

    it 'creates a new rental with a random id if none is given' do
      book = Book.new('To Kill a Mockingbird', 'Harper Lee')
      person = Person.new(21, 'John', 123)
      rental = Rental.new('01', book, person)

      expect(rental.date).to eq('01')
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(rental.id).to be_a(Integer)
    end
  end
end
