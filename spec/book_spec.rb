require "book"

describe Book do
  context "To instantiate a book" do
    Title = 'Fight Club'
    Author = 'Palaniuk'
    let(:book) { Book.new(Title, Author)}

    it "can add the title to the book" do
      expect(book.title).to eq('Fight Club')
    end

    it "can add author to the book" do
      expect(book.author).to eq('Palaniuk')
    end

    it "when book created there must not be rentals" do
      expect(book.rentals.length == 0).to be_truthy
    end
  end
end
