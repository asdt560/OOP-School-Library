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

  def tojson
    book_hash = {
      @book.title => {
        'title' => @book.title,
        'author' => @book.author,
        'rentals' => @book.rentals
      }
    }
    person_hash = if @person.classroom
                    {
                      @person.id => {
                        'age' => @person.age,
                        'name' => @person.name,
                        'p_p' => @person.parent_permission,
                        'id' => @person.id,
                        'classroom' => @person.classroom,
                        'rentals' => @person.rentals
                      }
                    }
                  else
                    {
                      @person.id => {
                        'age' => @person.age,
                        'name' => @person.name,
                        'specialization' => @person.specialization,
                        'id' => @person.id,
                        'rentals' => @person.rentals
                      }
                    }
                  end

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
