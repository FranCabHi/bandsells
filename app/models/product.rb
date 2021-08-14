class Product < ApplicationRecord
  belongs_to :user
  has_many :orders, through: :product_orders
  has_one_attached :image
  resourcify
end
