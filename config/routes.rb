Rails.application.routes.draw do
  resources :users do
    resources :albums, shallow: true
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :albums
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  root 'static_pages#home'
end
