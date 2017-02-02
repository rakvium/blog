require 'spec_helper'

RSpec.describe API, type: :request do
  describe 'GET /api/v1/posts' do
    it 'returns an array' do
      get '/api/v1/posts'
      response.body.should == MultiJson.encode([])
    end
  end
end
