require_relative 'book'
require_relative 'person'
class Rental
  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
  attr_accessor :date, :book, :person
end
