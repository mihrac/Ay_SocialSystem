class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :getCategoryNav
  before_action :authenticate_user!


private
def getCategoryNav
	@categoryNav = Category.all

end	



protected
def configure_permitted_parameters

	devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :email, :password, :remember_me])
	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname, :avatar, :username, :grad, :school, :email, :gender, :password, :remember_me, :bdate, :city, :about])
	devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :lastname, :username, :grad, :school, :email, :gender, :password, :remember_me, :bdate, :city, :about])





	#devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :lastname, :username, :grad, :school, :email, :gender, :password, :remember_me, :bdate, :city, :about) }
	#devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
	
end













end
