require_relative './book_options'
require_relative './people_options'
require_relative 'rental'

class RentalOptions 
  attr_accessor :books, :persons 

  def initialize(books, persons)
    @rentals = []
    @books = books.books
    @persons = persons.people
  end

  def create_rental
    puts "Select a book from the following list:\n"
    @books.each_with_index { |book, index| puts "#{index} Title: #{book.title} Author: #{book.author}" }
    book_number = gets.chomp
    book_obj = @books[book_number.to_i]

    puts "Select a person from the following list:\n"
    @persons.each_with_index { |person, index| puts "#{index} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    person_number = gets.chomp
    person_obj = @persons[person_number.to_i]

    print "Date: "
    date = gets.chomp
    rental = Rental.new(date, book_obj, person_obj)
    @rentals << rental
    print "Rental created succesfully!\n"
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
