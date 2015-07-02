Rails.application.routes.draw do
  resources :users do
    resources :albums, shallow: true, except: :delete do
      resources :images, shallow: true, only: [:show, :new, :create] do
        member do
          get 'cover'
        end
      end
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :albums
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  root 'static_pages#home'
end
