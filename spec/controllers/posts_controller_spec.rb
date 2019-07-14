# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PostsController, type: :controller do
  describe 'For a guest' do
    describe 'collection actions' do
      describe 'GET /posts/' do
        it 'responds with success' do
          get :index
          response.should be_successful
        end
      end

      describe 'GET /posts/new' do
        it 'requires login' do
          get :new
          response.should redirect_to new_user_session_path
        end
      end

      describe 'POST /posts/' do
        it 'requires login' do
          post :create
          response.should redirect_to new_user_session_path
        end
      end
    end

    describe 'member actions' do
      let!(:actual_post) { FactoryBot.create(:post) }

      describe 'GET /posts/:id' do
        it 'responds with success' do
          get :show, params: { id: actual_post.id }
          response.should be_successful
        end
      end

      describe 'GET /posts/:id/edit' do
        it 'requires login' do
          get :edit, params: { id: actual_post.id }
          response.should redirect_to new_user_session_path
        end
      end

      describe 'DELETE /posts/:id' do
        it 'requires login' do
          delete :destroy, params: { id: actual_post.id }
          response.should redirect_to new_user_session_path
        end
      end
    end
  end

  describe 'For a signed in user' do
    let(:user) { FactoryBot.create(:user) }

    before do
      sign_in(user)
    end

    describe 'collection actions' do
      describe 'GET /posts/' do
        it 'responds with success' do
          get :index
          response.should be_successful
        end
      end

      describe 'GET /posts/new' do
        it 'responds with success' do
          get :new
          response.should be_successful
        end
      end

      describe 'POST /posts/' do
        context 'with params' do
          it 'responds with success' do
            post :create, params: {
              post: {
                title: Faker::Lorem.characters,
                text: Faker::Lorem.paragraph
              }
            }
            response.should redirect_to(post_path(Post.order(created_at: :desc).first))
          end
        end
      end
    end

    describe 'member actions' do
      context 'for a post, created by the same user' do
        let(:actual_post) { FactoryBot.create(:post, user: user) }

        describe 'GET /posts/:id' do
          it 'responds with success' do
            get :show, params: { id: actual_post.id }
            response.should be_successful
          end
        end

        describe 'GET /posts/:id/edit' do
          it 'responds with success' do
            get :edit, params: { id: actual_post.id }
            response.should be_successful
          end
        end

        describe 'DELETE /posts/:id' do
          it 'responds with success' do
            post_to_delete = FactoryBot.create(:post, user: user)
            delete :destroy, params: { id: post_to_delete.id }
            response.should redirect_to(posts_path)
          end
        end
      end
    end
  end
end
