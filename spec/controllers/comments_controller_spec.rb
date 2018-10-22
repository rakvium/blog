# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'For a guest' do
    let(:parent_post) { FactoryBot.create(:post) }

    describe 'POST /posts/' do
      it 'requires login' do
        post :create, params: { post_id: parent_post.id }
        response.should redirect_to new_user_session_path
      end
    end
  end
end
