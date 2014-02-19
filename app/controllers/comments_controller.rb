class CommentsController < ApplicationController

#allow to delete comments only for authenticated users


#create comments to post
 def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end
 
#DESTROY the comment
def destroy
	@post = Post.find(params[:post_id])
	@comment = @post.comments.create(comment_params)
	redirect_to post_path(@post)
end

#BEWARE OF THE "private"
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
