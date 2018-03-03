Rails.application.routes.draw do

  get 'register', to: 'users#new', as: 'register'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  root to: 'products#index'

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, only: [:index, :new, :create]
  end
  
  resource :cart, only: [:show] do
    put :add_item
    delete :remove_item
  end

  resources :categories, only: [:show]
  resources :orders, only: [:create, :show]

  resources :products, only: [:index, :show] do
    resources :reviews, only: [:create]
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

end
