require_relative 'rental_options'

class BookOptions
  attr_reader :books

  def initialize
    @books = []
  end

  def list_all_books
    if @books.count.zero?
       puts "There is no book yet...\n"
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book added successfully'
  end
end
