require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

module Data
  def write_json(array, file_path)
    File.write(file_path, JSON.pretty_generate(array))
  end

  def read_json(file_path)
    return [] unless File.exist?(file_path)

    file = File.read(file_path)
    JSON.parse(file)
  end

  def save_books
    array = read_json('books.json')
    list_id = []
    array.each { |book| list_id.push(book['id']) }
    @booklist.each do |book|
      next if list_id.include?(book.id)

      array.push(
        {
          title: book.title,
          author: book.author,
          id: book.id
        }
      )
    end
    write_json(array, 'books.json')
  end

  def load_books
    parse_file = read_json('books.json')
    parse_file.each do |book|
      @booklist.push(Book.new(book['title'], book['author'], id: book['id']))
    end
  end

  def save_persons
    array = read_json('persons.json')
    list_id = []
    array.each { |person| list_id.push(person['id']) }
    @personlist.map do |person|
      unless list_id.include?(person.id)
        if person.instance_of?(Student)
          array.push(
            { id: person.id, type: person.class, age: person.age, name: person.name, classroom: person.classroom,
              parent_permission: person.parent_permission }
          )
        else
          array.push(
            { id: person.id, type: person.class, age: person.age,
              name: person.name, specialization: person.specialization }
          )
        end
      end
    end
    write_json(array, 'persons.json')
  end

  def load_persons
    parse_file = read_json('persons.json')
    parse_file.each do |person|
      if person['type'] == 'Teacher'
        teacher = Teacher.new(person['age'], person['name'], person['specialization'], id: person['id'])
        @personlist.push(teacher)
      else
        student = Student.new(person['age'], person['classroom'],
                              person['name'], id: person['id'],
                                              parent_permission: person['parent_permission'])
        @personlist.push(student)
      end
    end
  end

  def save_rentals
    if File.zero?('rentals.json')
      array = []
    else
      array = read_json('rentals.json')
      list_id = []
      array.each do |rental|
        list_id.push(rental['id'])
      end
      @rentallist.each do |rental|
        next if list_id.include?(rental.id)

        array.push(
          {
            date: rental.date, id: rental.id, book: rental.book.id, person: rental.person.id
          }
        )
      end
    end
    write_json(array, 'rentals.json')
  end

  def load_rentals
    parse_file = read_json('rentals.json')
    parse_file.each do |rental|
      date = rental['date']
      book1 = @booklist.find { |book| book.id == rental['book'] }
      person1 = @personlist.find { |person| person.id == rental['person'] }
      @rentallist.push(Rental.new(date, book1, person1, id: rental['id']))
    end
  end
end
