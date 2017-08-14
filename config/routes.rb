Rails.application.routes.draw do


  get 'static_pages/friends'

  get 'static_pages/about'

  devise_for :users
    
  devise_scope :user do
    authenticated do
      root 'posts#index' 
    end
    unauthenticated do
      root 'devise/sessions#new'
    end
  end
    
  get '/settings', to: 'devise/registrations#update'
  get '/users',    to: 'users#index'
  get '/pending',  to: 'static_pages#pending'
    
  resources :users, only: [:new, :show, :index]
  resources :posts, only: [:create, :destroy, :index]
  resources :friendships, only: [:index, :create, :update, :destroy]
end
