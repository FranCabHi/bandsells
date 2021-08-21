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

  private

  def params_token
    params[:token]
  end

  def set_order
    @order = Order.find(params[:cart][:order_id])
  end
end
