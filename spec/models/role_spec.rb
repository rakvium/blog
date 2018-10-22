# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Role, type: :model do
  context 'relations' do
    it { is_expected.to have_many(:users_roles) }
    it { is_expected.to have_many(:users).through(:users_roles) }
  end

  context 'validations' do
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
