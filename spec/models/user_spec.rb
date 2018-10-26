# frozen_string_literal: true

require 'spec_helper'

describe User, type: :model do
  describe 'relations' do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:comments) }
  end

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  describe '#role?' do
    subject { user.type }

    context 'when user is customer' do
      let(:user) { create(:user) }

      it 'has customer type' do
        is_expected.to eq 'Customer'
      end
    end

    context 'when user is root' do
      let(:user) { create(:user, :root) }

      it 'has root type' do
        is_expected.to eq 'Root'
      end
    end

    context 'when user is admin' do
      let(:user) { create(:user, :admin) }

      it 'has admin type' do
        is_expected.to eq 'Admin'
      end
    end
  end
end
