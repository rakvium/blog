# frozen_string_literal: true

# TODO: Add proper flash messages
class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  before_action :set_post, only: %i[create destroy]

  def create
    @comment = @post.comments.create(comment_params)
    redirect_to @post
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end
end
