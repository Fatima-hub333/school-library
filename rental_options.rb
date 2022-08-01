require './book_options'
require './people_options'

class RentalOptions 
  attr_reader :books, :persons 

  def initialize
    @rentals = []
  end
end
