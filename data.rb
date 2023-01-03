require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class Data
  def create_json_file
    unless File.exists?('books.json')
      File.open('books.json', 'w+')
    end
    unless File.exists?('persons.json')
      File.open('persons.json', 'w+')
    end
    unless File.exists?('rentals.json')
      File.open('rentals.json', 'w+')
    end
  end

  def load_json
    unless File.zero?('books.json')
      books_from_json = JSON.parse(File.read("books.json"))
      books_from_json.each { |book| 
        Book.new(book[1]['title'], book[1]['author'])
      }
    end
    unless File.zero?('persons.json')
      people_from_json = JSON.parse(File.read("persons.json"))
    end
    unless File.zero?('rentals.json')
      rentals_from_json = JSON.parse(File.read("rentals.json"))
    end
  end
end

Data.new.load_json