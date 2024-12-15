# frozen_string_literal: true

require 'spec_helper'

describe API do
  describe 'GET /api/v1/posts' do
    context 'when no posts created' do
      it 'returns an empty array' do
        get '/api/v1/posts'
        expect(response.parsed_body['posts']).to eq []
      end
    end

    context 'when post created' do
      let!(:post) { create(:post) }
      let(:represented_post) { JSON.parse(API::V1::Entities::Posts.represent(post).to_json) }

      it 'returns array with created post' do
        get '/api/v1/posts'
        expect(response.parsed_body['posts']).to include(represented_post)
      end
    end
  end
end
