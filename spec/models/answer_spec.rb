RSpec.describe Answer, type: :model do
  let!(:question) { create(:question) }

  it 'creates question' do
    expect(Answer.new(description: 'some description', question: question)).to be_valid
  end

  context 'when description is empty' do
    it 'is not valid' do
      expect(Answer.new(description: '', question: question)).to_not be_valid
    end
  end

  context 'when question is empty' do
    it 'is not valid' do
      expect(Answer.new(description: 'some description', question: nil)).to_not be_valid
    end
  end
end
