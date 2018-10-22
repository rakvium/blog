# frozen_string_literal: true

require 'spec_helper'

RSpec.describe User, type: :model do
  describe 'relations' do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:users_roles) }
    it { is_expected.to have_many(:roles).through(:users_roles) }
  end

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  describe '#role?' do
    let(:user) { create(:user) }

    context 'for equal role' do
      before { create(:role, name: :user) }

      subject { user.role?(:user) }

      it { is_expected.to be_truthy }
    end

    context 'for non-equal role' do
      before { create(:role, name: :admin) }

      subject { user.role?(:admin) }

      it { is_expected.to be_falsey }
    end
  end
end
