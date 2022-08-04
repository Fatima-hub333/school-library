require_relative 'person'
require_relative 'book'

class Rental
  attr_accessor :date, :book, :person, :person_id, :person_role

  def initialize(date, book, person, person_hash)
    @date = date
    @person_id = person_hash['id']
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
    @person_role = person_hash['role']
  end
end
