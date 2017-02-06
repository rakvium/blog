require 'spec_helper'

RSpec.describe Post, type: :model do
  describe 'fabric' do
    subject { FactoryGirl.create(:post) }
    it { should be_valid }
  end

  describe 'relations' do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
  end

  describe 'vaidations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(5).is_at_most(255) }
  end
end
