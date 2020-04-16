Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  get 'profile', to: 'users#show'
  resources :users, only: [:index, :show, :create, :edit, :update] do
    member do
      get :followings
      get :followers
    end
  end
  
  get 'newpost', to: 'microposts#new'
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  
  get 'search', to: 'prefectures#index'
  resources :prefectures, only: [:show]
end
