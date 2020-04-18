Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  get 'profile', to: 'users#show'
  resources :users, only: [:index, :show, :create, :edit, :update, :destroy] do
    member do
      get :followings
      get :followers
      
      get :withdrawal
      get :likes
    end
  end
  
  get 'newpost', to: 'microposts#new'
  resources :microposts, only: [:create, :destroy] do
    collection do
      get :timeline
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  
  get 'search', to: 'prefectures#index'
  resources :prefectures, only: [:show]
  
  #お気に入り昨日
  resources :favorites, only: [:create, :destroy]
  
  namespace :administrator do
    resources :users, only: [:index, :show, :destroy]
    resources :microposts, only: [:index, :new, :create, :destroy]
  end
end
