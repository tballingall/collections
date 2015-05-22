Rails.application.routes.draw do
  resources :users
  get 'signup', to: 'users#new', as: 'signup'
  root 'users#new'
end
