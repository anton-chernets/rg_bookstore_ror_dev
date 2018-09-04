Rails.application.routes.draw do
  root 'home#index'

  scope 'order' do
    post '/:class/:id', to: 'order#add_product', as: 'order_add_product'
    delete '/:class/:id', to: 'order#remove_product', as: 'order_remove_product'
  end

  resources :shopping_checkout, only: %i(show update)

  resource :shopping_cart, controller: :shopping_cart, path: '/', only: %i(show) do
    get 'complete'
  end

  devise_for :users
end