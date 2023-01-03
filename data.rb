require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class Data
  def create_json_file
    File.open('books.json', 'w+') unless File.exist?('books.json')
    File.open('persons.json', 'w+') unless File.exist?('persons.json')
    return if File.exist?('rentals.json')

    File.open('rentals.json', 'w+')
  end

  def load_json
    unless File.zero?('books.json')
      books_from_json = JSON.parse(File.read('books.json'))
      books_from_json.each do |book|
        newbook = book.values[0]
        Book.new(newbook['title'], newbook['author'])
      end
    end
    unless File.zero?('persons.json')
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
    return if File.zero?('rentals.json')

    rentals_from_json = JSON.parse(File.read('rentals.json'))
    rentals_from_json.each do |rental|
      newrental = rental.values[0]
      Rental.new(newrental['date'], newrental['book'], newrental['person'])
    end
  end
end
