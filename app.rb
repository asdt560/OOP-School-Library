require_relative 'list'
require_relative 'create'

class App
  def initialize
    @lister = Lister.new
    @creator = Creator.new
  end

  def select(number)
    case number
    when 1, 2, 6
      @lister.create_list(number)
    when 3, 4, 5
      @creator.create_object(number)
    end
  end
end
