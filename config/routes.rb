Rails.application.routes.draw do


  devise_for :admins



  get "upload" => "images#new", :as => "upload"

  

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users do
	member do
		get :following, :followers
	end
end



resources :posts do
  resources :comments

end

 resources :images do
  resources :comments
end


  resources :comments do
    resources :comments
  end

resources :relationships
resources :categories 


root 'images#index'

end
