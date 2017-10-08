Rails.application.routes.draw do


  devise_for :admins
  get "upload" => "images#new", :as => "upload"

  get 'images/new'

  get 'images/create'

  get 'images/destroy'

  get 'images/index'

  get 'categories/new'

  get 'categories/create'

  get 'categories/edit'

  get 'categories/update'

  get 'categories/destroy'

  get 'categories/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users 
resources :posts do
  resources :comments, module: :posts

end

 resources :images do
  resources :comments, module: :posts
end


resources :categories 


root 'images#index'

end
