class PostsController < ApplicationController

#allow to delete posts only for authenticated users


#publish the new post
def new
  @post = Post.new
end

#create a post
def create
  @post = Post.new(post_params)
 
  if @post.save
    redirect_to @post
  else
    render 'new'
  end
end
 
#show the just created|edited post
def show
  @post = Post.find(params[:id])
end

#show all posts
def index
@posts = Post.all
end

#def edit
def edit
  @post = Post.find(params[:id])
end

#update params of the one post of listing
def update
@post = Post.find(params[:id])
 
  if @post.update(post_params)
    redirect_to @post
  else
    render 'edit'
  end
end

#DESTROY the post
def destroy
@post = Post.find(params[:id])
  @post.destroy
 
  redirect_to posts_path
end

#BEWARE OF THE "private"!
private
  def post_params
    params.require(:post).permit(:title, :text)
  end


end
