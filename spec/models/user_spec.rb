# frozen_string_literal: true

require 'spec_helper'

describe User, type: :model do
  describe 'relations' do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:nullify) }
    it { is_expected.to have_many(:authentication_tokens).dependent(:delete_all) }
  end

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  describe '#name' do
    subject(:user_name) { user.name }

    context 'when user does not have a name' do
      let(:user) { described_class.new }

      it do
        expect(user_name).to be_a String
      end

      context 'when user persisted' do
        let(:user) { create(:user, first_name: nil, last_name: nil) }

        it do
          expect(user_name).to be_a String
        end
      end
    end

    context 'when user has a name' do
      let(:first_name) { 'Firstname' }
      let(:last_name) { 'Lastname' }
      let(:user) { described_class.new(first_name:, last_name:) }

      it do
        expect(user_name).to eq("#{first_name} #{last_name}")
      end
    end
  end
end
