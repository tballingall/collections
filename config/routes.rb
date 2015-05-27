Rails.application.routes.draw do
  resources :sessions
  resources :collections
  get 'static_pages/home'

  get 'static_pages/error'

  resources :users
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'profile', to: 'users#show', as: 'profile'
  root 'static_pages#home'
end
