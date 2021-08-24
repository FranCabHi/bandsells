class CartsController < ApplicationController
  before_action :authenticate_user!

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
        success: "http://localhost:3000/payment-info",
        failure: "http://localhost:3000/",
        pending: "http://localhost:3000/"
      },
      auto_return: "approved",
    }
    preference_response = sdk.preference.create(preference_data)

    preference = preference_response[:response]
  
    @preference_id = preference['id']

    sandbox_init_point = preference["sandbox_init_point"]
    redirect_to sandbox_init_point
  end

  def payment_info
    status_param = params[:status]
    if status_param == "approved"
      Payment.create(
        status: status_param,
        total: current_order.total,
        merchant_order_id: params[:merchant_order_id],
        order_id: current_order.id)
      current_order.update_attribute(:state, 2)
      redirect_to orders_path, notice: "Payment processed successfully"
    else
     redirect_to cart_path, alert: "Failed payment process, please try again"
    end
  end

  private

  def params_token
    params[:token]
  end

end
