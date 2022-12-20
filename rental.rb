require_relative 'book'
require_relative 'person'
class Rental
  def initialize(date)
    @date = date
    @book = nil
    @person = nil
  end
  attr_accessor :date, :book, :person

  def add_book(book)
    @book = book
    book.rentals.push(self) unless book.rentals.include?(self)
  end

  def add_person(person)
    @person = person
    person.rentals.push(self) unless person.rentals.include?(self)
  end
end
