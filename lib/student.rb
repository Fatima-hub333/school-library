require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_accessor :classroom, :age, :name, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: 'true')
    super(age, name, parent_permission)
  end

  def owner=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
