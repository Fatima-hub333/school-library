require_relative 'rental_options'

class BookOptions
  attr_reader :books

  def initialize
    @books = []
  end
end
