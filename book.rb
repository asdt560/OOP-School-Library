require 'json'
class Book
  def initialize(title, author, id: Random.rand(1..1000))
    @title = title
    @author = author
    @id = id
    @rentals = []
  end
  attr_accessor :title, :author, :rentals, :id

  def add_rental(rental)
    @rentals.push(rental)
  end
end
