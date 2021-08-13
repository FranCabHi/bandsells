Rails.application.routes.draw do
  resources :orders
  resources :products
  devise_for :users

  get "dashboard", to: "main#dashboard"
  root to: "main#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
