require "rental"
require "book"
require "person"

describe Rental do
  context "To instantiate a rental object" do
    date = '2020-06-12'
    book = Book.new("Harry", "Jk")
    person = Person.new("24", "Mary")
    person_hash = {"role":"Student","id":"178","name":"Mary","age":"16","parent_permission":"false"}
    
    let(:rental) { Rental.new(date, book, person, person_hash)}
    
    it "can add the date to the rental" do
      expect(rental.date).to eq('2020-06-12')
    end

    it "can add book details to the rental" do
      expect(rental.book.title).to eq('Harry')
      expect(rental.book.author).to eq("Jk")
    end

    it "can add book details to the rental" do
      expect(rental.person.age).to eq('24')
      expect(rental.person.name).to eq("Mary")
    end
  end
end