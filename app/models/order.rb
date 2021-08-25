class Order < ApplicationRecord
  belongs_to :user
  has_many :product_orders, dependent: :destroy
  has_many :products, through: :product_orders
  has_one :payment, dependent: :destroy
  resourcify

  enum state: [:created, :pending, :completed]

  def add_product(product_id, quantity)
    product = Product.find(product_id)
    if product && (product.stock > 0)
      product_orders.create(product_id: product.id, quantity: quantity, price: product.unit_price)
      compute_total
    end
  end

  def counting_products
    qty = product_orders.count
    update_attribute(:quantity, qty)
  end

  def compute_total
    sum = 0
    product_orders.each do |product|
      sum += product.price
    end
    update_attribute(:total, sum)
  end

  def compute_stock
    product_orders.each do |product_order|
      new_stock = product_order.product.stock - product_order.quantity
      product_order.product.update(stock: new_stock) 
    end
  end

end
