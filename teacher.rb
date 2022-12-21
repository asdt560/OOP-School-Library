require_relative 'person'

class Teacher < Person
  def initialize(age, name, parent_permission: true, id: Random.rand(1..1000))
    super(age, name, parent_permission: parent_permission, id: id)
    @specialization = nil
  end

  attr_reader :specialization

  def can_use_services?
    true
  end
end
