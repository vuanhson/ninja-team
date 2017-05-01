Rails.application.routes.draw do  
  
  get 'users/show'
  get 'search', to: 'static_pages#search'
  resources :images
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  get 'login', to: 'static_pages#login'
  resources :posts do
    resources :comments
  end
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
