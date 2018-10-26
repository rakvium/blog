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
end
