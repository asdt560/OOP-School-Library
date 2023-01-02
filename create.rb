require_relative 'book'
require_relative 'rental'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'

class Creator
  def create_object(number)
    case number
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
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
    Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    Book.all.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not ID): '
    Person.all.each_with_index { |person, index| puts "#{index}) Name: #{person.name}, ID:#{person.id}" }
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    Rental.new(date, Book.all[book_index], Person.all[person_index])
    print 'Rental created successfully'
  end
end
