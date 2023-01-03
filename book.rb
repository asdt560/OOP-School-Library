require 'json'
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

  def tojson
    temp_hash = {
      @title => {
        'title' => @title,
        'author' => @author,
        'rentals' => @rentals
      }
    }
    if File.zero?('books.json')
      File.write('books.json', JSON.pretty_generate([temp_hash]))
    else
      data_from_json = JSON.parse(File.read('books.json'))
      data_from_json = [data_from_json] if data_from_json.class != Array
      File.write('books.json', JSON.pretty_generate(data_from_json << temp_hash))
    end
  end
end
