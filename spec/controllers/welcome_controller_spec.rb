# frozen_string_literal: true

require 'spec_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'GET /' do
    it 'responds with success' do
      get :index
      response.should be_successful
    end
  end
end
