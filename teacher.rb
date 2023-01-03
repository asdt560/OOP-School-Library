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

  def tojson
    tempHash = {
      @id => {
        "age" => @age,
        "name" => @name,
        "p_p" => @parent_permission,
        "id" => @id,
        "specialization" => @specialization,
        "rentals" => @rentals
      }
    }
    if File.zero?('persons.json')
      File.open("persons.json","w+") do |f|
        f.write(JSON.pretty_generate(tempHash))
      end
    else
    data_from_json = JSON.parse(File.read("persons.json"))
    data_from_json = [data_from_json] if data_from_json.class != Array
      File.open("persons.json","w+") do |f|
        f.write(JSON.pretty_generate(data_from_json << tempHash))
      end
    end
  end
end
