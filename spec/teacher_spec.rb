require 'rspec'
require_relative '../teacher'

describe Teacher do
  subject(:teacher) { described_class.new(age, name, specialization) }

  let(:age) { 30 }
  let(:name) { 'John Smith' }
  let(:specialization) { 'Math' }

  describe '#initialize' do
    it 'sets the age attribute' do
      expect(teacher.age).to eq(age)
    end

    it 'sets the name attribute' do
      expect(teacher.name).to eq(name)
    end

    it 'sets the specialization attribute' do
      expect(teacher.specialization).to eq(specialization)
    end

    it 'sets the id attribute' do
      expect(teacher.id).to be_a(Integer)
      expect(teacher.id).to be_between(1, 1000)
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
