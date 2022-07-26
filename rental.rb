require_relative 'person'
require_relative 'book'

class Rental
  attr_accessor :date, :book, :person
  
  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = personperson.rentals << self
  end
end