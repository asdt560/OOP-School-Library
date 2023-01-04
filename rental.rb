require_relative 'book'
require_relative 'person'
class Rental
  def initialize(date, book, person, id: Random.rand(1..1000))
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
    @id = id
  end

  attr_accessor :date, :book, :person, :id
end
