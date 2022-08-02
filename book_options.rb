require_relative 'rental_options'
require 'json'

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

  def save_book
    # get stored book data as objects
    data = []
    @books.each do |book|
      title = book.title
      author = book.author
      data.push({title: title, author: author})
    end
    # check if file exists
    if !File.exists?("./books.json")
      File.new("./books.json", "w+")
    end
    # serialize array to json
    File.open("books.json", "w") { |f| f.puts data.to_json }
  end
end
