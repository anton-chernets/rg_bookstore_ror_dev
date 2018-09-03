Rails.application.routes.draw do
  root 'home#index'

  # get 'register', to: 'users#new', as: 'register'
  # resources :users

  devise_for :users
end
