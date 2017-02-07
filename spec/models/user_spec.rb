require 'spec_helper'

RSpec.describe User, type: :model do
  describe 'factory' do
    subject { FactoryGirl.create(:user) }
    it { should be_valid }
  end

  describe 'relations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:users_roles) }
    it { should have_many(:roles).through(:users_roles) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:email).case_insensitive }
  end
end
