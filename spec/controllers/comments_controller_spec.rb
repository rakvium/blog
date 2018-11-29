# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CommentsController, type: :controller do
  let(:author) { FactoryBot.create(:author) }
  let(:parent_post) { FactoryBot.create(:post, user: author) }
  let(:comment) do
    FactoryBot.create(
      :comment, user: author, post: parent_post, body: Faker::Yoda.quote
    )
  end

  describe 'POST /posts/:post_id/comments' do
    describe 'For a guest' do
      it 'requires login' do
        post :create, params: { post_id: parent_post.id }
        response.should redirect_to new_user_session_path
      end
    end

    describe 'For a registered user' do
      it 'creates a new comment' do
        sign_in(author)
        post :create, params: {
          post_id: parent_post.id,
          comment: { body: Faker::Yoda.quote }
        }
        response.should redirect_to parent_post
      end
    end
  end

  describe 'DELETE /posts/:post_id/comments/:id' do
    it 'requires login' do
      delete :destroy, params: { post_id: parent_post.id, id: comment.id }
      response.should redirect_to new_user_session_path
    end
  end
end
