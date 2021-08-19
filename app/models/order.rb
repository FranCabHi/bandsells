class Order < ApplicationRecord
  belongs_to :user
  has_many :product_orders
  has_many :products, through: :product_orders
  has_one :payment
  resourcify

  def add_product(product_id, quantity)
    product = Product.find(product_id)
    if product && (product.stock > 0)
      product_orders.create(product_id: product.id, quantity: quantity, price: product.unit_price)
      compute_total
    end
  end

  def compute_total
    sum = 0
    product_orders.each do |product|
      sum += product.price
    end
    update_attribute(:total, sum)
  end

  def set_state_completed 
    update_attribute(state: "completed")
  end

end
