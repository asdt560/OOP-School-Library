require_relative 'person'

class Teacher < Person
  def initialize(age, name, specialization, id: Random.rand(1..1000))
    super(age, name, id, parent_permission: true)
    @specialization = specialization
  end

  attr_accessor :specialization

  def can_use_services?
    true
  end
end
