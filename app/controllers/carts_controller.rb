class CartsController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_order

  def update
    product = params[:cart][:product_id]
    quantity = params[:cart][:quantity]

    current_order.add_product(product, quantity)

    redirect_to root_url, notice: "Product added successfuly"
  end

  def show
    @order = current_order
  end


  private

  def params_token
    params[:token]
  end

  def set_order
    @order = Order.find(params[:cart][:order_id])
  end
end
