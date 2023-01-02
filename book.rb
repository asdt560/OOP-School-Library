class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
  attr_accessor :title, :author, :rentals

  def add_rental(rental)
    @rentals.push(rental)
    book.rental = self
  end
end
