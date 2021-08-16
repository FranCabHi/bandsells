class ProductOrdersController < ApplicationController

  def create
      @order = current_order
      @product_order = @order.product_orders.new(order_params)
      @order.save
      session[:order_id] = @order.id
  end



  def update
      @order = current_order
      @product_order = @order.product_orders.find(params[:id])
      @product_order.update_attributes(order_params)
      @product_orders = current_order.product_orders
  end

  def destroy
      @order = current_order
      @product_order = @order.product_orders.find(params[:id])
      @product_order.destroy
      @product_orders = current_order.product_orders
  end


  private

  def order_params
      params.require(:product_order).permit(:product_id, :quantity)
  end
end