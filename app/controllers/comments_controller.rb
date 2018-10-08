# frozen_string_literal: true

# controls users' comments to the posts
class CommentsController < ApplicationController
  before_action :authenticate_user!

  # CREATE comment to the post
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_url(@post)
  end

  # DESTROY the comment
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy if can?(:destroy, @comment)
    redirect_to post_url(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end
end
