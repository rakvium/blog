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
    let!(:user_role) { create(:role, name: :user) }
    let!(:admin_role) { create(:role, name: :admin) }
    let(:user) { create(:user) }
    context 'for equal role' do
      subject { user.role?(:user) }
      it { should be_truthy }
    end

    context 'for non-equal role' do
      subject { user.role?(:admin) }
      it { should be_falsey }
    end
  end
end
