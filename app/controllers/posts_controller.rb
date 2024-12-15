# frozen_string_literal: true

# TODO: Add proper flash messages
class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  load_and_authorize_resource except: %i[show index]

  before_action :set_post, only: %i[show edit update destroy]

  PER_PAGE = 3

  def index
    @posts = Post.paginate(page: params[:page], per_page: PER_PAGE)
  end

  def show
    @comments = @post.comments
    @user     = @post.user
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
    else
      redirect_to @post
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text, :commit).merge(user_id: current_user.id)
  end
end
