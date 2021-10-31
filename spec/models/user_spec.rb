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
end
