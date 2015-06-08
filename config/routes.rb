Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, except: :destroy
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  root 'static_pages#home'
  resources :photos, only: [:new, :create, :index]
  end
