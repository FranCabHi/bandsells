Rails.application.routes.draw do
  resources :orders
  resources :products do
    member do
      put 'like' => 'products#like'
    end
  end

  Rails.application.routes.draw do
    devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      omniauth_callbacks: 'users/omniauth_callbacks'
    }
  end


  root to: "main#index"

  
  delete "users/:id", to: "users#destroy", as: "destroy_user"

  get "users_list", to: "main#users"
  get "product_list", to: "main#products"
  get "dashboard", to: "main#dashboard"
  get "/edit_role/:user_id", to: "main#edit_role", as: "edit_role"
  post "/edit_role/:user_id", to: "main#edit_role", as: "update_role"

  resource :cart, only: [:show, :update]
  delete 'cart/:order_id/remove_product/:product_id/', to: 'carts#remove_product', as: 'remove-product'
  get "cart/:order_id/mercado-pago", to: "carts#mercadopago", as: "mercado-pago"
  get "payment-info", to: "carts#payment_info"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
