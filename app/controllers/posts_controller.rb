class PostsController < ApplicationController
	
before_action :authenticate_user!, except: [:index, :show]

def index
@posts = Post.all
end

def destroy
 @post = Post.find params[:id]
 @post.destroy

 redirect_to posts_path, :notice => "Your post has been deleted"
end



def show
	@post = Post.find(params[:id])
end

def new
	@post = current_user.posts.build
end


def create
	@post = current_user.posts.build(post_params)
	@post.save
	redirect_to @post
end








private

def post_params
	params.require(:post).permit(:text)
end



end
