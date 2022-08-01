require "./student"
require "./teacher"

class PeopleOptions
  attr_accessor :people

  def initialize
    @people = []
  end

  def list_all_people
    if @people.count.zero?
       puts "There is not a person yet...\n"
    end

    @people.each do |person|
      puts "[#{person.class}] ID: #{person.id} Name: #{person.name} Age: #{person.age}"
    end
  end

  def create_person
    print "Do you want to create student (1) or teacher (2): "
    type_of_person = gets.chomp
    case type_of_person
    when "1"
      print "Name: "
      name = gets.chomp
      print "Age: "
      age = gets.chomp
      print "Parent permission [Y/N]: "
      pp = gets.chomp
      pp = false if pp == "n" 
      pp = true if pp == "y"
      student = Student.new(name, age, parent_permission: pp)
      @people.push(student)
      puts "Student created succesfully!"
    when "2"
      print "Name: "
      name = gets.chomp
      print "Age: "
      age = gets.chomp
      print "Specialization: "
      special = gets.chomp
      teacher = Teacher.new(special, age, name)
      @people.push(teacher)
      puts "Teacher created succesfully!"
    end
  end
end
