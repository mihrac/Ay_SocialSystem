class UsersController < ApplicationController

	before_action :authenticate_user!, only: [:edit, :update]
	before_action :check_authorization, only: [:edit, :update]
	#before_action :set_user


def index
	@users = User.all
	
end

def show
	@user = User.find(params[:id])

end


def edit
end


	

def update

	if @user.update(user_params)
		flash.now[:alert] = "kaydettik"
		redirect_to @user
	else
		flash.now[:alert] = "Yanlış giden bir şeyler var başkan! Kaydedemedik"
		render :edit
	end
end







private

def check_authorization
	unless current_user.id == params[:id].to_i
		redirect_to root_url
	end
end

def set_user
	@user = User.find(params[:id]) 
    @users = User.all
	end

def user_params
params.require(:user).permit(:username, :avatar)
end

end
