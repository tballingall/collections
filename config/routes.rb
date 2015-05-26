Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/error'

  resources :users
  get 'signup', to: 'users#new', as: 'signup'
  root 'static_pages#home'
end
