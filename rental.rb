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

  attr_accessor :date, :book, :person

  def hash_book
    book_hash = {
      @book.title => {
        'title' => @book.title,
        'author' => @book.author,
        'rentals' => @book.rentals
      }
    }
    if @person.classroom
      hash_student(book_hash)
    else
      hash_teacher(book_hash)
    end
  end

  def hash_student(book_hash)
    person_hash = {
      @person.id => {
        'age' => @person.age,
        'name' => @person.name,
        'p_p' => @person.parent_permission,
        'id' => @person.id,
        'classroom' => @person.classroom,
        'rentals' => @person.rentals
      }
    }
    tojson(book_hash, person_hash)
  end

  def hash_teacher(book_hash)
    person_hash = {
      @person.id => {
        'age' => @person.age,
        'name' => @person.name,
        'specialization' => @person.specialization,
        'id' => @person.id,
        'rentals' => @person.rentals
      }
    }
    tojson(book_hash, person_hash)
  end

  def tojson(book_hash, person_hash)
    temp_hash = {
      @date => {
        'date' => @date,
        'book' => book_hash,
        'person' => person_hash
      }
    }
    if File.zero?('rentals.json')
      File.write('rentals.json', JSON.pretty_generate([temp_hash]))
    else
      data_from_json = JSON.parse(File.read('rentals.json'))
      data_from_json = [data_from_json] if data_from_json.class != Array
      File.write('rentals.json', JSON.pretty_generate(data_from_json << temp_hash))
    end
  end
end
