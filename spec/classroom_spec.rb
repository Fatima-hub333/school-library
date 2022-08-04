require "classroom"

describe Classroom do
  context "To instantiate a classroom class correctly" do
    label = '13th Grade'
    let(:classroom) { Classroom.new(label) }

    it "can add and access the classroom label" do
      expect(classroom.label).to eq("13th Grade")
    end

    it "when class created expect to have zero students" do
      expect(classroom.students.length == 0).to be_truthy
    end
  end
end
