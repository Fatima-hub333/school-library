require "book"
require "rental"

describe Book do
  context "To instantiate a book" do

    it "can add the title and author to the book" do
      Title = 'title'
      Author = 'author'
      book = Book.new(Title, Author)
      expect(book.title).to eq('title')
    end
  end
end