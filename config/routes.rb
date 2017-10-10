Rails.application.routes.draw do


  devise_for :admins
  get "upload" => "images#new", :as => "upload"

  

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users 
resources :posts do
  resources :comments

end

 resources :images do
  resources :comments
end


  resources :comments do
    resources :comments
  end


resources :categories 


root 'images#index'

end
