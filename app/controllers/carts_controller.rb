class CartsController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_order

  def update
    product = params[:cart][:product_id]
    quantity = params[:cart][:quantity]

    current_order.add_product(product, quantity)
    current_order.counting_products
    redirect_to cart_url, notice: "Product added successfuly"
  end

  def show
    @order = current_order
  end

  def remove_product
      order = Order.find(params[:order_id])
      product = Product.find(params[:product_id])
      order.products.delete(product)
      order.compute_total
      order.counting_products
      redirect_to cart_path, notice: "Product removed successfuly"
  end

  def mercadopago
    order = Order.find(params[:order_id])
   
    require 'mercadopago'
    sdk = Mercadopago::SDK.new(Rails.application.credentials.mercadopago[:access_token])

    preference_data = {
      items: [
        {
          title: "Order no. #{order.id}",
          unit_price: order.total,
          quantity: 1
        }
      ],
      back_urls: {
        success: "http://localhost:3000/orders",
        failure: "http://localhost:3000/cart",
        pending: "http://localhost:3000/products"
      },
      auto_return: "approved",
    }
    preference_response = sdk.preference.create(preference_data)

    preference = preference_response[:response]
    
    # Este valor reemplazará el string "<%= @preference_id %>" en tu HTML
    @preference_id = preference['id']

    sandbox_init_point = preference["sandbox_init_point"]
    redirect_to sandbox_init_point
  end

  private

  def params_token
    params[:token]
  end

  def set_order
    @order = Order.find(params[:cart][:order_id])
  end
end
