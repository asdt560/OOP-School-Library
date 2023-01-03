require_relative 'app'
require_relative 'data'

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
    @data = Data.new
  end

  def select
    option = gets.chomp.to_i
    case option
    when 1..6
      @app.select(option)
      run
    when 7
      puts 'Thank you for using this App!'
    else
      puts 'Incorrect Input: Option does not exist'
      run
    end
  end

  def start
    @data.load_json
    run
  end

  def run
    @data.create_json_file
    @interface.interface
    select
  end

  private :select
end

Main.new.start
