require 'spec_helper'

RSpec.describe API, type: :request do
  describe 'GET /api/v1/posts' do
    context 'no posts created' do
      it 'returns an empty array' do
        get '/api/v1/posts'
        response.body.should == MultiJson.encode([])
      end
    end
    context 'post created' do
      let!(:post) { FactoryGirl.create(:post) }
      it 'returns array with posts' do
        get '/api/v1/posts'
        response.body.should eq MultiJson.encode([post])
      end
    end
  end
end
