require_relative 'person'
require_relative 'classroom'

class Student < Person
  def initialize(age, classroom, name, id: Random.rand(1..1000), parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
    @classroom = classroom
  end

  attr_accessor :classroom, :parent_permission

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def tojson
    temp_hash = {
      @id => {
        'age' => @age,
        'name' => @name,
        'p_p' => @parent_permission,
        'id' => @id,
        'classroom' => @classroom,
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
