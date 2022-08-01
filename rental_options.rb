require './book_options'
require './people_options'

class RentalOptions 
  attr_reader :rentals

  def initialize
    @rentals = []
  end
end