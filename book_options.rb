require_relative 'rental_options'

class BookOptions
  attr_reader :books, :title, :author

  def initialize
    @books = []
  end

  def list_all_books
    puts "There is no book yet...\n" if @books.count.zero?
    @books.each do |book|
      puts "[#{book.class}] Title: #{book.title} Author: #{book.author}"
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
