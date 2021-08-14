class Product < ApplicationRecord
  resourcify
  belongs_to :user
  has_many :product_orders
  has_many :orders, through: :product_orders
  has_one_attached :image
  
  validates :title, :stock, :unit_price, presence: true
  validates :description, length: {maximum: 500, too_long: "%#{count} es el límite de caracteres."}
  validates :title, length: {maximum: 140, too_long: "%#{count} es el límite de caracteres."}
  validates :price, numericality: {only_integer: true}
end
