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
    temp_hash = {
      @date => {
        'date' => @date,
        'book' => @book,
        'person' => @person
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
