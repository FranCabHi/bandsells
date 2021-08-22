Rails.application.routes.draw do
  resources :orders
  resources :products
  devise_for :users

  root to: "dashboard", to: "main#dashboard"
  get "users", to: "main#users"
  get "/edit_role/:user_id", to: "main#edit_role", as: "edit_role"
  post "/edit_role/:user_id", to: "main#edit_role", as: "update_role"

  resource :cart, only: [:show, :update]
  delete 'cart/:order_id/remove_product/:product_id/', to: 'carts#remove_product', as: 'remove-product'
  get "cart/:order_id/mercado-pago", to: "carts#mercadopago", as: "mercado-pago"
  get "payment-info", to: "carts#payment_info"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
