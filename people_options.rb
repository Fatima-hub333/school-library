require './student'
require './teacher'

class PeopleOptions
  attr_accessor :people

  def initialize
    @people = []
  end

  def list_all_people
    puts "There is not a person yet...\n" if @people.count.zero?

    @people.each do |person|
      puts "[#{person.class}] ID: #{person.id} Name: #{person.name} Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to create student (1) or teacher (2): '
    type_of_person = gets.chomp
    case type_of_person
    when '1'
      student
    when '2'
      teacher
    end
  end

  def student
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Parent permission [Y/N]: '
    pp = gets.chomp
    pp = false if pp == 'n'
    pp = true if pp == 'y'
    student = Student.new(age, name, parent_permission: pp)
    @people.push(student)
    puts 'Student created succesfully!'
  end

  def teacher
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Specialization: '
    special = gets.chomp
    teacher = Teacher.new(special, age, name)
    @people.push(teacher)
    puts 'Teacher created succesfully!'
  end

  def save_persons
    # get stored book data as objects
    data = []
    @people.each do |person|
      role = person.class
      id = person.id
      name = person.name
      age = person.age
      parent_permission = person.parent_permission
      data.push({role: role, id: id, name: name, age: age, parent_permission: parent_permission})
    end
    # check if file exists
    if !File.exists?("./people.json")
      File.new("./people.json", "w+")
    end
    # serialize array to json
    File.open("people.json", "w") { |f| f.puts data.to_json }
  end
end
