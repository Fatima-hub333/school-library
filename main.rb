require './app'

def main
  app = App.new
  app.greeter
  input = nil
  app.storage
  while input != '7'
    app.instructions
    input = gets.chomp
    options(input, app)
  end
  app.save_books
  app.save_persons
end

def options(input, app)
  case input
  when '1'
    app.list_all_books
  when '2'
    app.list_all_people
  when '3'
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.list_rentals_by_person_id
  end
end

main
