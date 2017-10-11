class BlockingshipsController < ApplicationController


def create
	@user = User.find(params[:blocked_id])
	current_user.block(@user)
	redirect_back fallback_location: @user
end

def destroy
		@user = Blockingship.find(params[:id]).blocked
	current_user.unblock(@user)
	redirect_back fallback_location: @user
	
end



end
