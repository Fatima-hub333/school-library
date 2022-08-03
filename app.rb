require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'classroom'
require_relative 'people_options'
require_relative 'book_options'
require_relative 'rental_options'

class App
  def menu
    puts
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def greeter
    puts "Welcome to school library!\n\n"
  end

  def instructions
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def storage
    @people_options = PeopleOptions.new
    @book_options = BookOptions.new
    @rental_options = RentalOptions.new
  end

  def list_all_books
    @book_options.list_all_books
    puts "\n"
  end

  def list_all_people
    @people_options.list_all_people
    puts "\n"
  end

  def create_person
    @people_options.create_person
    puts "\n"
  end

  def create_book
    @book_options.create_book
    puts "\n"
  end

  def create_rental
    @rental_options.create_rental
    puts "\n"
  end

  def list_rentals_by_person_id
    @rental_options.list_rentals_by_person_id
    puts "\n"
  end

  def save_books
    @book_options.save_books
  end

  def save_persons
    @people_options.save_persons
  end
end
