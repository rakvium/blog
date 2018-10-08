# frozen_string_literal: true

# controls users' posts
class PostsController < ApplicationController
  # uncomment next string when users had roles

  # allow to delete posts only for http authenticated users
  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  # allow to posts only for authenticated users
  before_action :authenticate_user!, except: %i[show index]
  load_and_authorize_resource except: %i[show index]
  skip_load_resource only: [:create]

  def validate_user
    redirect_to new_user_session_url unless current_user
  end

  # publish the new post
  def new
    @post = Post.new
  end

  # create a post
  def create
    @post = Post.new(post_params)
    if @post.save
      @post.update_attributes(user_id: current_user.id)
      redirect_to @post
    else
      render 'new'
    end
  end

  # show the just created|edited post
  def show
    @post     = Post.find(params[:id])
    @comments = Post.find(params[:id]).comments.all
    @user     = @post.user
  end

  # show all posts
  def index
    @posts = Post.order('created_at DESC').paginate(page: params[:page], per_page: 3)
  end

  # def edit
  def edit
    @post = Post.find(params[:id])
  end

  # update params of the one post of listing
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  # DESTROY the post
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :commit, :user_id)
  end
end
