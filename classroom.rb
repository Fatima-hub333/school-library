require_relative 'student'

class Classroom
  attr_accessor :label, :students

  def initialize(label, students)
    @label = label
    @students = students
  end

  def add_students(student)
    @students.push(student)
    student.classroom = self
  end
end
