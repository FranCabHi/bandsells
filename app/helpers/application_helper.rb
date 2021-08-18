module ApplicationHelper
    def product_owner(product)
        user_signed_in? && current_user.id == product.user_id || current_user.admin?
    end
    
    def current_order
      if !session[:order_id].nil?
          Order.find(session[:order_id])
      else
          Order.new
      end
  end
end
