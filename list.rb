require_relative 'book'
require_relative 'rental'
require_relative 'person'

class Lister
  def create_list(number)
    objects = {
      1 => Book,
      2 => Person,
      6 => Rental
    }
    list = ObjectSpace.each_object(objects[number]).to_a
    case number
    when 1
      list.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    when 2
      list.each_with_index { |person, index| puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    when 6
      print 'Type the ID of person: '
      id = gets.chomp.to_i
      puts 'Rentals: '
      list.each do |rental|
        if rental.person.id == id
          puts "Book: #{rental.book.title} Rented by #{rental.person.name} on Date: #{rental.date}"
        end
      end
    end
  end
end