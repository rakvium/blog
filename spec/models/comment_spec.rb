# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Comment, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'vaidations' do
    it { is_expected.to validate_presence_of(:user_id) }
  end
end
