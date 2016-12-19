# controls users' comments to the posts
class CommentsController < ApplicationController
  # allow to delete comments only for http authenticated users
  # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  # CREATE comment to the post
  def create
    @post = Post.find(params[:post_id])
    # TODO: use current_user instead of user_id hidden field
    @comment = @post.comments.create(params.require(:comment).permit(:user_id, :body))
    redirect_to post_url(@post)
  end

  # DESTROY the comment
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_url(@post)
  end
end
