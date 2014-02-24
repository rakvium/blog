class CommentsController < ApplicationController

#allow to delete comments only for http authenticated users
#http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy


#CREATE comment to the post
 def create
    #binding.pry
    #@user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params.require(:comment).permit(:user_id, :body))
    redirect_to post_path(@post)
  end
 
#DESTROY the comment
def destroy
  @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:id])
  @comment.destroy
  redirect_to post_path(@post)
end


end