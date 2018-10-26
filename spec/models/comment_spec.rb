# frozen_string_literal: true

require 'spec_helper'

describe Comment, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:user) }
  end
end
