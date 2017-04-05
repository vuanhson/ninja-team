Rails.application.routes.draw do  
  devise_for :users
  get 'login', to: 'static_pages#login'
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
end
