require 'spec_helper'

RSpec.describe User, type: :model do
  describe 'relations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:users_roles) }
    it { should have_many(:roles).through(:users_roles) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe '#role?' do
    let!(:user_role) { FactoryGirl.create(:role, name: :user) }
    let!(:admin_role) { FactoryGirl.create(:role, name: :admin) }
    let(:user) { FactoryGirl.create(:user) }
    context 'for equal role' do
      subject { user.role?(:user) }
      it { should be_true }
    end

    context 'for non-equal role' do
      subject { user.role?(:admin) }
      it { should be_false }
    end
  end
end
