require_relative 'rental_options'
require 'json'

class BookOptions
  attr_reader :books, :title, :author

  def initialize
    unless File.exist?('./books.json')
      File.new('./books.json', 'w+')
      File.write('./books.json', [])
    end
    books_file = File.read('./books.json')
    books_data = JSON.parse(books_file)
    @books = books_data
  end

  def list_all_books
    books_file = File.read('./books.json')
    books_data = JSON.parse(books_file)
    if books_data.count.zero?
      puts "There is no book yet...\n"
    else
      books_data.each do |book|
        puts "[Book] Title: #{book['title']}  Author: #{book['author']}"
      end
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << { 'title' => book.title.to_s, 'author' => book.author.to_s }
    save_books
    puts 'Book added successfully'
  end

  def save_books
    data = []
    @books.each do |book|
      data << ({ title: book['title'], author: book['author'] })
    end
    File.open('books.json', 'w') { |f| f.puts data.to_json }
  end
end
