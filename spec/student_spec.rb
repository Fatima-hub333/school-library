require "student"

describe Student do
  context "To instantiate a student correctly" do
    name = "Mary"
    age = '17'
    let(:student) { Student.new(age, name, parent_permission: false) }

    it "can add and access the name of the student" do
      expect(student.name).to eq("Mary")
    end

    it "can store and expose student's age" do
      expect(student.age).to eq("17")
    end

    it "can store and expose student's parent permission" do
      expect(student.parent_permission).to be false
    end
  end
end