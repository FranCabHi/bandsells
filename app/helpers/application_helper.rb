module ApplicationHelper
    def product_owner(product)
        user_signed_in? && current_user.id == product.user_id || current_user.admin?
    end

    def existing_order
      Order.find_by(user_id: current_user.id, state: 0)
    end

end
