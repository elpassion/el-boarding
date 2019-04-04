RSpec.describe Epic, type: :model do
  let(:epic_list) { create_list(:epic_list, 2) }

  it 'validates epic list presence' do
    expect(Epic.new(name: 'some name')).to be_valid
  end

  it 'validates name' do
    expect(Epic.new(name: '')).not_to be_valid
  end

  it 'is valid object with epic list' do
    expect(Epic.new(name: '', epic_lists: epic_list)).not_to be_valid
  end
end
