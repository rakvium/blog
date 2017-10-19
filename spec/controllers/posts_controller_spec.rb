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
      let!(:actual_post) { FactoryGirl.create(:post) }

      describe 'GET /posts/:id' do
        it 'responds with success' do
          get :show, id: actual_post.id
          response.should be_successful
        end
      end

      describe 'GET /posts/:id/edit' do
        it 'requires login' do
          get :edit, id: actual_post.id
          response.should redirect_to new_user_session_path
        end
      end

      describe 'DELETE /posts/:id' do
        it 'requires login' do
          delete :destroy, id: actual_post.id
          response.should redirect_to new_user_session_path
        end
      end
    end
  end

  describe 'For a signed in user' do
    let(:user) { FactoryGirl.create(:user) }

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
          xit 'responds with success' do
            post :create
            response.should be_successful
          end
        end
      end
    end

    describe 'member actions' do
      context 'for a post, created by the same user' do
        let!(:actual_post) { FactoryGirl.create(:post, user: user) }

        describe 'GET /posts/:id' do
          it 'responds with success' do
            get :show, id: actual_post.id
            response.should be_successful
          end
        end

        describe 'GET /posts/:id/edit' do
          it 'responds with success' do
            get :edit, id: actual_post.id
            response.should be_successful
          end
        end

        describe 'DELETE /posts/:id' do
          xit 'responds with success' do
            delete :destroy, id: actual_post.id
            response.should be_successful
          end
        end
      end
    end
  end
end
