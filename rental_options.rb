require_relative './book_options'
require_relative './people_options'
require_relative 'rental'

class RentalOptions
  attr_accessor :books, :persons

  def initialize(books, persons)
    if !File.exists?("./rentals.json")
      File.new("./rentals.json", "w+")
      File.write("./rentals.json", [])
    end
    rentals_file = File.read("./rentals.json")
    rentals_data = JSON.parse(rentals_file)
    @rentals = rentals_data
    @books = books.books
    @persons = persons.people
  end

  def create_rental
    data = []
    puts "Select a book from the following list:\n"
    @books.each_with_index do |book, index|
      title = book['title']
      author = book['author']
      puts "#{index} Title: #{title}, Author: #{author}"
      book_number = gets.chomp
      book_obj = @books[book_number.to_i]

      puts "Select a person from the following list:\n"
      @persons.each_with_index do |person, index|
      name = person['name']
      age = person['age']
      puts "#{index} Name: #{name}, Age: #{age}"
      person_number = gets.chomp
      person_obj = @persons[person_number.to_i]
      print 'Date: '
      date = gets.chomp
      rental = Rental.new(date, book_obj, person_obj)
      @rentals << rental
      print "Rental created succesfully!\n"
    end
  end


  #   @books.each_with_index { |book, index| puts "#{index} Title: #{book.title} Author: #{book.author}" }
  #   book_number = gets.chomp
  #   book_obj = @books[book_number.to_i]

  #   puts "Select a person from the following list:\n"
  #   @persons.each_with_index do |person, index|
  #     puts "#{index} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  #   end
  #   person_number = gets.chomp
  #   person_obj = @persons[person_number.to_i]

  #   print 'Date: '
  #   date = gets.chomp
  #   rental = Rental.new(date, book_obj, person_obj)
  #   @rentals << rental
  #   print "Rental created succesfully!\n"
  end

  def list_rentals_by_person_id
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
  end
end
