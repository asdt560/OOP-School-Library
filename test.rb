require 'json'

class TestObj
  def initialize(title, author)
    @title = title
    @author = author
  end
  attr_accessor :title, :author
  

  def fromjson(string)
    file = File.read(string)
    data = JSON.parse(file)
    TestObj.new(data['title'], data['author'])
  end
end

testobj = TestObj.new('lord of the title', 'author')
testobj2 = TestObj.new('titlebutnew', 'author2')

testobj2.tojson
testobj.tojson
