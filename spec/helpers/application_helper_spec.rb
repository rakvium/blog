require 'spec_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#resource_name' do
    it 'returns :user' do
      helper.resource_name.should equal(:user)
    end
  end

  describe '#resource' do
    it 'should be object of User class' do
      helper.resource.should be_an_instance_of(User)
    end
  end
end
