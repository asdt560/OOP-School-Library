require_relative 'data'

class App
  def initialize
    @booklist = []
    @personlist = []
    @rentallist = []
  end

  include Data

  def save_data
    save_books
    save_persons
    save_rentals
  end

  def load_data
    load_books
    load_persons
    load_rentals
  end

  def select(number)
    case number
    when 1
      list_books
    when 2
      list_persons
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    end
  end

  def list_books
    @booklist.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_persons
    @personlist.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_rentals
    print 'Type the ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals: '
    @rentallist.each do |rental|
      if rental.person.id == id
        puts "Book: #{rental.book.title} Rented by #{rental.person.name} on Date: #{rental.date}"
      end
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
      @personlist.push(newstudent)
      puts 'Student created successfully'
    else
      create_teacher(name, age)
    end
  end

  def create_teacher(name, age)
    print 'Specialization: '
    specialization = gets.chomp
    newteach = Teacher.new(age, name, specialization)
    @personlist.push(newteach)
    puts 'Teacher created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    newbook = Book.new(title, author)
    @booklist.push(newbook)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    list_books
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not ID): '
    list_persons
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    newrental = Rental.new(date, @booklist[book_index], @personlist[person_index])
    @rentallist.push(newrental)
    print 'Rental created successfully'
  end
end
