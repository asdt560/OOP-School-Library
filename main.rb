require_relative 'app'

class Interface
  @welcome = 'Welcome to School Library App!', ''
  def interface
    puts @welcome
    puts 'Please choose and option by entering a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals'
    puts '7 - Exit'
    @welcome = ''
  end
end

class Main
  def initialize
    @app = App.new
    @interface = Interface.new
  end

  def select
    option = gets.chomp.to_i
    selection = {
      1 => 'list_books',
      2 => 'list_people',
      3 => 'create_person',
      4 => 'create_book',
      5 => 'create_rental',
      6 => 'list_rentals_person'
    }
    case option
    when 1..6
      @app.send(selection[option])
      run
    when 7
      puts 'Thank you for using this App!'
    else
      puts 'Incorrect Input: Option does not exist'
      run
    end
  end

  def run
    @interface.interface
    select
  end

  private :select
end

Main.new.run
