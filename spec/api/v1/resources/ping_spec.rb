# frozen_string_literal: true

require 'spec_helper'

describe API::V1::Resources::Ping do
  include Rack::Test::Methods

  def app
    API::V1::Resources::Ping
  end

  describe 'GET /ping' do
    # TODO: check if response should actually be like this
    let(:expected_response) { { result: 'pong' }.to_s }

    before { get '/ping' }

    it 'responds with 200' do
      expect(last_response).to have_http_status(:ok)
    end

    it 'returns a pong' do
      expect(last_response.body).to eq(expected_response)
    end
  end
end
