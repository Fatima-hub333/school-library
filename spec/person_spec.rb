require "person"

describe Person do
  context "To instantiate a book" do
    Name = 'Fatima'
    Age = '25'
    Parent_Permission = true
    let(:person) { Person.new(Age, Name, Parent_Permission)}

    it "can add the name to the person" do
      expect(person.name).to eq('Fatima')
    end

    it "can add age to the person" do
      expect(person.age).to eq('25')
    end

    it "can access parent permission to the person" do
      expect(person.parent_permission).to be true
    end
  end
end
