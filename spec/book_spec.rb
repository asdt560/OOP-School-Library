require 'rspec'
require_relative '../book'
require_relative '../rental'

describe Book do
  describe '#initialize' do
    it 'creates a new instance of a Book with a title, author, and id' do
      book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald', id: 123)
      expect(book.title).to eq('The Great Gatsby')
      expect(book.author).to eq('F. Scott Fitzgerald')
      expect(book.id).to eq(123)
      expect(book.rentals).to eq([])
    end

    it 'sets a random id if no id is provided' do
      book = Book.new('To Kill a Mockingbird', 'Harper Lee')
      expect(book.id).to be_a(Integer)
      expect(book.id).to be > 0
      expect(book.id).to be <= 1000
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the rentals array and sets the rental\'s book to self' do
      book = Book.new('The Catcher in the Rye', 'J.D. Salinger')
      person = Person.new(21, 'John', 123)
      rental = Rental.new('01', book, person, id: 123)
      book.add_rental(rental)
      expect(book.rentals).to include(rental)
      expect(rental.book).to eq(book)
    end
  end
end
