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
    tempHash = {
      @title => {
        "title" => @title,
        "author" => @author,
        "rentals" => @rentals
      }
    }
    if File.zero?('books.json')
      File.open("books.json","w+") do |f|
        f.write(JSON.pretty_generate(tempHash))
      end
    else
    data_from_json = JSON.parse(File.read("books.json"))
    data_from_json = [data_from_json] if data_from_json.class != Array
      File.open("books.json","w+") do |f|
        f.write(JSON.pretty_generate(data_from_json << tempHash))
      end
    end
  end
end
