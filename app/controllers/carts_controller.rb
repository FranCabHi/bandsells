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

  def destroy
    product = params[:cart][:product_id]
    quantity = params[:cart][:quantity]

    current_order.remove_product(product, quantity)

    redirect_to cart_path, notice: "Product removed successfuly"

  end

  private

  def params_token
    params[:token]
  end

  def set_order
    @order = Order.find(params[:cart][:order_id])
  end
end
