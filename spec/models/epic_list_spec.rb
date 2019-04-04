RSpec.describe EpicList, type: :model do
  it 'validates name' do
    expect(EpicList.new(name: '')).not_to be_valid
  end
end
