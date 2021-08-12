class Product < ApplicationRecord
  belongs_to :user
  has_many :orders, through: :product_orders
  resourcify
end
