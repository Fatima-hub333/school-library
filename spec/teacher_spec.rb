require 'teacher'

describe Teacher do
  context 'To instantiate a teacher correctly' do
    name = 'Ayesha'
    age = '30'
    specialization = 'Music'
    let(:teacher) { Teacher.new(specialization, age, name) }

    it 'can add and access the name of the teacher' do
      expect(teacher.name).to eq('Ayesha')
    end

    it 'can store and expose teacher age' do
      expect(teacher.age).to eq('30')
    end

    it 'can store and expose teacher specialization' do
      expect(teacher.specialization).to eq('Music')
    end
  end
end
