require_relative 'book'
require_relative 'rental'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'list'

class Creator
  def initialize
    @list = Lister.new
  end

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
      newstudent = Student.new(age, classroom, name, parent_permission: permission)
      newstudent.tohash
      puts 'Student created successfully'
    else
      create_teacher(name, age)
    end
  end

  def create_teacher(name, age)
    print 'Specialization: '
    specialization = gets.chomp
    newteach = Teacher.new(age, name, specialization)
    newteach.tohash
    puts 'Teacher created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    newbook = Book.new(title, author)
    newbook.tohash
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    book_list = @list.create_list(1)
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not ID): '
    person_list = @list.create_list(2)
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    newrental = Rental.new(date, book_list[book_index], person_list[person_index])
    newrental.tojson
    print 'Rental created successfully'
  end
end
