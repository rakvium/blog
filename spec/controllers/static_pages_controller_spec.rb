# frozen_string_literal: true

require 'spec_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'GET #about' do
    it 'responds with success' do
      get :about
      response.should be_successful
    end
  end

  describe 'GET #contact' do
    it 'responds with success' do
      get :contact
      response.should be_successful
    end
  end

  describe 'GET #help' do
    it 'responds with success' do
      get :help
      response.should be_successful
    end
  end
end
