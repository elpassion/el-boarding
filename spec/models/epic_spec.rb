RSpec.describe Epic, type: :model do
  let(:epic_list) { create(:epic_list) }

  it 'validates epic list presence' do
    expect(Epic.new(name: 'some name')).not_to be_valid
  end

  it 'validates name' do
    expect(Epic.new(name: '', epic_list: epic_list)).not_to be_valid
  end
end
