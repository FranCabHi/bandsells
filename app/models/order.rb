class Order < ApplicationRecord
  belongs_to :user
  has_many :product_orders
  has_many :products, through: :product_orders
  has_one :payment
  resourcify
  before_save :set_subtotal

  def subtotal
    product_orders.collect{|product_order| product_order.valid? ? product_order.unit_price*product_order.quantity : 0}.sum
end



private

def set_subtotal
    self[:subtotal] = subtotal
end

end
