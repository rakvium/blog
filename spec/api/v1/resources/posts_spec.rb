# frozen_string_literal: true

require 'spec_helper'

describe API::V1::Resources::Posts do
  include Rack::Test::Methods

  def app
    API::V1::Resources::Posts
  end

  describe 'GET /api/v1/posts' do
    let(:expected_response) { { posts: Post.all }.to_json }

    before { get '/api/v1/posts' }

    it 'responds with 200' do
      expect(last_response).to have_http_status(:ok)
    end

    it 'returns all the posts' do
      expect(last_response.body).to eq(expected_response)
    end
  end
end
