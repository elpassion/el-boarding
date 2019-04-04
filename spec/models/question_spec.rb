RSpec.describe Question, type: :model do

  it 'creates question' do
    expect(Question.new(description: 'some description')).to be_valid
  end

  context 'when description is empty' do
    it 'is not valid' do
      expect(Question.new(description: '')).to_not be_valid
    end
  end
end
