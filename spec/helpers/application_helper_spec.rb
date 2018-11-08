# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#resource_name' do
    it 'returns :user' do
      helper.resource_name.should equal(:user)
    end
  end

  describe '#resource' do
    it 'is object of Author class' do
      helper.resource.should be_an_instance_of(Author)
    end
  end

  describe '#devise_mapping' do
    it 'is devise mapping for :user' do
      helper.devise_mapping.should equal(Devise.mappings[:user])
    end
  end
end
