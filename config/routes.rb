Rails.application.routes.draw do  
  resources :comments
  get 'users/show'

  resources :images
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  get 'login', to: 'static_pages#login'
  resources :posts
  resources :users, only: :show do
  	resources :posts
  end
  resources :tags, only: [:create, :destroy] do
  	collection do
  		delete "remove"
  	end
  	member do
  		delete "delete"
  	end
  end
   resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  resources :likes, only: [:create, :destroy]
  root 'static_pages#home'
  
end
