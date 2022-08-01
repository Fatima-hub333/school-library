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
    @persons.each_with_index { |person, index| puts "#{index} [#{person.class}] Name: #{person.name} Age: #{person.age}" }
    person_number = gets.chomp
    person_obj = @persons[person_number.to_i]

    print "Date: "
    date = gets.chomp
    Rental.new(date, book_obj, person_obj)
    print "Rental created succesfully!\n"
  end
end
