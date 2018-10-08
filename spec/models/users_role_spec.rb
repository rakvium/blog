# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UsersRole, type: :model do
  context 'relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:role) }
  end
end
