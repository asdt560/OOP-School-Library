require_relative 'person'
require_relative 'classroom'

class Student < Person
  def initialize(age, classroom, name, parent_permission: true, id: Random.rand(1..1000))
    super(age, name, parent_permission: parent_permission, id: id)
    @classroom = classroom
  end

  attr_accessor :classroom

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def tojson
    tempHash = {
      @id => {
        "age" => @age,
        "name" => @name,
        "p_p" => @parent_permission,
        "id" => @id,
        "classroom" => @classroom,
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
