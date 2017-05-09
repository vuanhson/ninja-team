Rails.application.routes.draw do  
  
  resources :post_attachments
  resources :notifications
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
  resources :static
  resources :likes, only: [:create, :destroy]
  root 'static_pages#home'
  get 'manager_account', to: 'users/registrations#edit'
  get 'get_started/avatar', to: 'static_pages#preset_avatar'
  get 'get_started/find_friend', to: 'static_pages#find_friend'
  get 'get_started/details_infor', to: 'static_pages#find_friend'
  post 'search', to: 'static_pages#search'
  get 'search_result', to: 'static_pages#search_result  '
  resources :notifications  
end
