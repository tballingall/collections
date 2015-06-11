Rails.application.routes.draw do
  resources :users, except: :destroy, shallow: true do
    resources :closets, only: [:new, :create, :index], controller: 'closets/users'
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :closets, only: [:new, :create, :index]
  resources :photos, only: [:new, :create, :index]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  root 'static_pages#home'
end
