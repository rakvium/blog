# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AuthenticationToken do
  subject { create(:authentication_token) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_agent) }
    it { is_expected.to validate_presence_of(:ip_address) }
    it { is_expected.to validate_presence_of(:value_digest) }
    it { is_expected.to validate_presence_of(:last_used_at) }
    it { is_expected.to validate_uniqueness_of(:value_digest) }
  end
end
