require 'spec_helper'

RSpec.describe Comment, type: :model do
  describe 'relations' do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end

  describe 'vaidations' do
    it { should validate_presence_of(:user_id) }
  end
end
