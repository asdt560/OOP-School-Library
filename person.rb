require_relative 'nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', id = Random.rand(1..1000), parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def is_of_age?
    @age >= 18
  end
end
