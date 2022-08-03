require './student'
require './teacher'

class PeopleOptions
  attr_accessor :people

  def initialize
    unless File.exist?('./people.json')
      File.new('./people.json', 'w+')
      File.write('./people.json', [])
    end
    people_file = File.read('./people.json')
    people_data = JSON.parse(people_file)
    @people = people_data
  end

  def list_all_people
    people_file = File.read('./people.json')
    people_data = JSON.parse(people_file)
    if people_data.count.zero?
      puts "There is not a person yet...\n"
    else
      people_data.each do |person|
        puts "[#{person['role']}] ID: #{person['id']} Name: #{person['name']}  Age: #{person['age']}"
      end
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
    @people << { 'role' => 'Student', 'id' => student.id.to_s,
                 'name' => student.name.to_s, 'age' => student.age.to_s,
                 'parent_permission' => student.parent_permission.to_s }
    save_student
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
    @people << { 'role' => 'Teacher', 'id' => teacher.id.to_s,
                 'name' => teacher.name.to_s, 'age' => teacher.age.to_s,
                 'specialization' => teacher.specialization.to_s }
    puts 'Teacher created succesfully!'
    save_teacher
  end

  def save_student
    data = []
    @people.each do |person|
      role = person['role']
      id = person['id']
      name = person['name']
      age = person['age']
      parent_permission = person['parent_permission']
      data << ({ role: role, id: id, name: name, age: age, parent_permission: parent_permission })
    end
    File.new('./people.json', 'w+') unless File.exist?('./people.json')
    File.open('people.json', 'w') { |f| f.puts data.to_json }
  end

  def save_teacher
    data = []
    @people.each do |person|
      role = person['role']
      id = person['id']
      name = person['name']
      age = person['age']
      special = person['specialization']
      data << ({ role: role, id: id, name: name, age: age, specialization: special })
    end
    File.new('./people.json', 'w+') unless File.exist?('./people.json')
    File.open('people.json', 'w') { |f| f.puts data.to_json }
  end
end
