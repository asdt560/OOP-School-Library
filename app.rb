require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def list_books
    Book.all.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_people
    Person.all.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to load a student (1) or a teacher (2) data? [Input the require number]: '
    option = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    if option == '1'
      print 'Has parent permission [Y/N]: '
      permission = gets.chomp
      permission = permission.downcase == 'y'
      print 'Classroom: '
      classroom = gets.chomp
      Student.new(age, classroom, name, parent_permission: permission)
      puts 'Student created successfully'
    else
      print 'Specialization: '
      specialization = gets.chomp
      Teacher.new(age, name, specialization)
      puts 'Teacher created successfully'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    Book.new(author, title)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    Book.all.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp
    puts 'Select a person from the following list by number (not ID): '
    Person.all.each_with_index { |person, index| puts "#{index}) Name: #{person.name}, ID:#{person.id}" }
    person_index = gets.chomp
    print 'Date: '
    date = gets.chomp
    Rental.new(date, Book.all[book_index], Person.all[person_index])
    print 'Rental created successfully'
  end

  def list_rentals_person
    print 'Type the ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals: '
    Rental.all.each do |rental|
      if rental.person.id == id
        puts "Book: #{rental.book.title} Rented by #{rental.person.name} on Date: #{rental.date}"
      end
    end
  end
end
