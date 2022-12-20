class Rental
  def initialize(date)
    @date = date
    @book = nil
    @person = nil
  end
  attr_accessor :date, :book, :person

  def set_book(book)
    @book = book
    book.rentals.push(self) unless book.rentals.include?(self)
  end

  def set_person(person)
    @person = person
    person.rentals.push(self) unless person.rentals.include?(self)
  end
end
