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
end
