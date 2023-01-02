require_relative 'book'
require_relative 'rental'
require_relative 'person'

class Lister
  def initialize
    @list = []
  end

  def create_list(number)
    objects = {
      1 => Book,
      2 => Person,
      6 => Rental
    }
    @list = ObjectSpace.each_object(objects[number]).to_a
    case number
    when 1
      list_books
    when 2
      list_people
    when 6
      list_rentals
    end
  end

  def list_books
    @list.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_people
    @list.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_rentals
    print 'Type the ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals: '
    @list.each do |rental|
      if rental.person.id == id
        puts "Book: #{rental.book.title} Rented by #{rental.person.name} on Date: #{rental.date}"
      end
    end
  end
end
