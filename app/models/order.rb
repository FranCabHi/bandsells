class Order < ApplicationRecord
  belongs_to :user
  has_many :products, through: :product_orders
  has_one :payment
  resourcify
end
