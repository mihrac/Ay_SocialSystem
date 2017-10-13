Rails.application.routes.draw do


  devise_for :admins

  devise_for :users 




  get "upload" => "images#new", :as => "upload"


 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users do
	member do
		get :following, :followers
    get :blocking, :blockers
	end
end

resources :relationships
resources :blockingships

resources :personal_messages, only: [:new,:create]
resources :conversations, only: [:index, :show] 



resources :categories 




resources :posts do
  resources :comments

end

 resources :images do
  resources :comments
end


  resources :comments do
    resources :comments
  end




root 'images#index'

end



