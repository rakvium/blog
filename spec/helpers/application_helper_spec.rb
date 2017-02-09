require 'spec_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#resource_name' do
    it 'returns :user' do
      helper.resource_name.should equal(:user)
    end
  end
end
