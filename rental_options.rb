# rubocop:disable all
require_relative './book_options'
require_relative './people_options'
require_relative 'rental'

class RentalOptions
  attr_accessor :books, :persons

  def initialize
    unless File.exist?('./rentals.json')
      File.new('./rentals.json', 'w+')
      File.write('./rentals.json', [])
    end
    rentals_file = File.read('./rentals.json')
    rentals_data = JSON.parse(rentals_file)
    @rentals = rentals_data
    books_file = File.read('./books.json')
    books_data = JSON.parse(books_file)
    @books = books_data
    people_file = File.read('./people.json')
    people_data = JSON.parse(people_file)
    @persons = people_data
  end

  def create_rental
    puts "Select a book from the following list:\n"
    @books.each_with_index do |book, index|
      title = book['title']
      author = book['author']
      puts "#{index} Title: #{title}, Author: #{author}"
    end

    book_number = gets.chomp
    book_hash = @books[book_number.to_i]
    book_obj = Book.new(book_hash['title'], book_hash['author'])

    puts "Select a person from the following list:\n"
    @persons.each_with_index do |person, index|
      name = person['name']
      age = person['age']
      puts "#{index} Name: #{name}, Age: #{age}"
    end

    person_number = gets.chomp
    person_hash = @persons[person_number.to_i]
    person_obj = Person.new(person_hash['age'], person_hash['name'])

    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, book_obj, person_obj, person_hash)
    @rentals << { 'date' => rental.date.to_s, 'title' => rental.book.title.to_s,
                  'author' => rental.book.author.to_s, 'person' => rental.person.name.to_s,
                  'id' => rental.person_id.to_s, 'role' => rental.person_role.to_s }
    save_rentals
    print "Rental created succesfully!\n"
  end

  def list_rentals_by_person_id
    print 'ID of person: '
    id = gets.chomp
    puts 'Rentals:'
    @rentals.each do |rental|
      if (rental['id']).to_s == id
        puts "Date: #{rental['date']} Title: #{rental['title']} by #{rental['author']} [#{rental['role']}] Name: #{rental['person']} ID: #{rental['id']}"
      end
    end
  end

  def save_rentals
    data = []
    @rentals.each do |rental|
      data << ({ date: rental['date'], title: rental['title'], author: rental['author'], person: rental['person'],
                 id: rental['id'], role: rental['role'] })
    end
    File.open('rentals.json', 'w') { |f| f.puts data.to_json }
  end
end
