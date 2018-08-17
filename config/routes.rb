Rails.application.routes.draw do
  get 'register', to: 'users#new', as: 'register'
  resources :users
end
