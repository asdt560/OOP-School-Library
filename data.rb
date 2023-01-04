require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class Data
  def create_json_file
    File.open('books.json', 'w+') unless File.exist?('books.json')
    File.open('persons.json', 'w+') unless File.exist?('persons.json')
    File.open('rentals.json', 'w+') unless File.exist?('rentals.json')
  end

  def load_json
    load_books unless File.zero?('books.json')
    load_persons unless File.zero?('persons.json')
    load_rentals unless File.zero?('rentals.json')
  end

  def load_books
    books_from_json = JSON.parse(File.read('books.json'))
    books_from_json.each do |book|
      newbook = book.values[0]
      Book.new(newbook['title'], newbook['author'])
    end
  end

  def load_persons
    people_from_json = JSON.parse(File.read('persons.json'))
    people_from_json.each do |person|
      newperson = person.values[0]
      if newperson['classroom']
        Student.new(newperson['age'], newperson['classroom'], newperson['p_p'], newperson['id'], newperson['name'])
      else
        Teacher.new(newperson['age'], newperson['name'], newperson['id'], newperson['specialization'])
      end
    end
  end

  def load_rentals
    rentals_from_json = JSON.parse(File.read('rentals.json'))
    rentals_from_json.each do |rental|
      newrental = rental.values[0]
      Rental.new(newrental['date'], newrental['book'], newrental['person'])
    end
  end
end
