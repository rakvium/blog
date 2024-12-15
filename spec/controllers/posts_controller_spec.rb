# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PostsController do
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
          response.should redirect_to new_user_session_path(locale: nil)
        end
      end

      describe 'POST /posts/' do
        it 'requires login' do
          post :create
          response.should redirect_to new_user_session_path(locale: nil)
        end
      end
    end

    describe 'member actions' do
      let!(:actual_post) { create(:post) }

      describe 'GET /posts/:id' do
        it 'responds with success' do
          get :show, params: { id: actual_post.id }
          response.should be_successful
        end
      end

      describe 'GET /posts/:id/edit' do
        it 'requires login' do
          get :edit, params: { id: actual_post.id }
          response.should redirect_to new_user_session_path(locale: nil)
        end
      end

      describe 'DELETE /posts/:id' do
        it 'requires login' do
          delete :destroy, params: { id: actual_post.id }
          response.should redirect_to new_user_session_path(locale: nil)
        end
      end
    end
  end

  describe 'For a signed in user' do
    let(:user) { create(:user) }

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

        context 'with invalid params' do
          it 'stays on the same page' do
            post :create, params: {
              post: {
                title: '',
                text: ''
              }
            }
            response.should be_successful
          end
        end
      end
    end

    describe 'member actions' do
      context 'when a post is created by the same user' do
        let(:actual_post) { create(:post, user:) }

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

        describe 'PUT /posts/:id' do
          it 'redirects to the updated post' do
            put :update, params: { id: actual_post.id, post: { title: Faker::Lorem.characters } }
            response.should redirect_to(post_path(actual_post))
          end

          context 'when params are not valid' do
            it 'does not redirect' do
              put :update, params: { id: actual_post.id, post: { title: '' } }
              response.should_not redirect_to(post_path(actual_post))
            end
          end
        end

        describe 'DELETE /posts/:id' do
          let(:post_to_delete) { create(:post, user:) }

          it 'redirects to the posts path' do
            delete :destroy, params: { id: post_to_delete.id }
            response.should redirect_to(posts_path)
          end

          context 'when cannot destroy' do
            it 'redirects to the post\'s page' do
              allow(Post).to receive(:find).and_return(post_to_delete)
              allow(post_to_delete).to receive(:destroy).and_return(false)
              delete :destroy, params: { id: post_to_delete.id }
              response.should redirect_to(post_path(post_to_delete))
            end
          end
        end
      end
    end
  end
end
