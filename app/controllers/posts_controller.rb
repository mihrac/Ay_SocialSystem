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


def edit
	@post = Post.find params[:id]
	

end


def update
	@post = Post.find params[:id]

	if @post.update(post_params)
		flash.now[:alert] = "kaydettik"
		redirect_to @post
	else
		flash.now[:alert] = "Yanlış giden bir şeyler var başkan! Kaydedemedik"
		render :edit
	end
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
