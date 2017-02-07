require 'spec_helper'

RSpec.describe Role, type: :model do
  context 'factory' do
    subject { FactoryGirl.build(:role) }
    it { should be_valid }
  end

  context 'relations' do
    it { should have_many(:users_roles) }
    it { should have_many(:users).through(:users_roles) }
  end

  context 'validations' do
    it { should validate_uniqueness_of(:name) }
  end
end
