class PostsController < ApplicationController
	
before_action :authenticate_user!, except: [:index, :show]


def index
@posts = Post.all
end


def destroy
 @post = Post.find(params[:id])
 @post.destroy

 redirect_to posts_path, :notice => "Your post has been deleted"
end


def edit
	@post = Post.find(params[:id])
	

end


def update
	@post = Post.find(params[:id])

	if current_user.admin? or @post.user == current_user

	if @post.update(post_params)
		flash.now[:alert] = "kaydettik"
		redirect_to @post
	else
		flash.now[:alert] = "Yanlış giden bir şeyler var başkan! Kaydedemedik"
		render :edit
	end

else
	flash.now[:alert] = "Oooo birileri yetkileri aşmaya çalışıyor Albayım!"

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
	params.require(:post).permit(:text, :image, :category_id)
end





end
