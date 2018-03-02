Rails.application.routes.draw do

  root to: 'products#index'

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, only: [:index, :new, :create]
  end
  
  resource :cart, only: [:show] do
    put    :add_item
    delete :remove_item
  end

  resources :categories, only: [:show]
  resources :orders, only: [:create, :show]
  resources :products, only: [:index, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

end
