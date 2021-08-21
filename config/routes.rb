Rails.application.routes.draw do
  resources :orders
  resources :products
  devise_for :users

  get "dashboard", to: "main#dashboard"
  root to: "main#index"

  resource :cart, only: [:show, :update]
  delete 'cart/:order_id/remove_product/:product_id/', to: 'carts#remove_product', as: 'remove-product'
  get "cart/:order_id/mercado-pago", to: "carts#mercadopago", as: "mercado-pago"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
