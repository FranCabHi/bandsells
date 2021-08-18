Rails.application.routes.draw do
  resources :orders
  resources :products
  resources :product_orders
  resources :carts, only:[:show]
  devise_for :users
  get 'carts/show'

  get "dashboard", to: "main#dashboard"
  get "shop", to: "main#shop"
  root to: "main#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
