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
        newbook = book.values[0]
        Book.new(newbook['title'], newbook['author'])
      }
    end
    unless File.zero?('persons.json')
      people_from_json = JSON.parse(File.read("persons.json"))
      people_from_json.each { |person|
        newperson = person.values[0]
        if newperson['classroom']
          Student.new(newperson['age'], newperson['classroom'], newperson['p_p'], newperson['id'], newperson['name'])
        else
          Teacher.new(newperson['age'], newperson['name'], newperson['id'], newperson['specialization'])
        end
      }
    end
    unless File.zero?('rentals.json')
      rentals_from_json = JSON.parse(File.read("rentals.json"))
      rentals_from_json.each { |rental|
        newrental = rental.values[0]
        Rental.new(newrental['date'], newrental['book'], newrental['person'])
      }
    end
  end
end
