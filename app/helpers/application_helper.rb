module ApplicationHelper
    def product_owner(product)
        user_signed_in? && current_user.id == product.user_id 
    end
end
