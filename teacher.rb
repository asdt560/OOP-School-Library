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

  def tojson
    temp_hash = {
      @id => {
        'age' => @age,
        'name' => @name,
        'p_p' => @parent_permission,
        'id' => @id,
        'specialization' => @specialization,
        'rentals' => @rentals
      }
    }
    if File.zero?('persons.json')
      File.write('persons.json', JSON.pretty_generate([temp_hash]))
    else
      data_from_json = JSON.parse(File.read('persons.json'))
      data_from_json = [data_from_json] if data_from_json.class != Array
      File.write('persons.json', JSON.pretty_generate(data_from_json << temp_hash))
    end
  end
end
