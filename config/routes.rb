Rails.application.routes.draw do
  resources :profiles
  resources :sessions
  resources :collections
  get 'static_pages/home'

  get 'static_pages/error'

  resources :users
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  root 'static_pages#home'
end
