require_relative 'person'

class Teacher < Person
  def initialize(age, name, specialization, id: Random.rand(1..1000))
    super(age, name, parent_permission: true, id: id)
    @specialization = specialization
  end

  attr_accessor :specialization

  def can_use_services?
    true
  end
end
