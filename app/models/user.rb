class User < ApplicationRecord
  rolify
  after_create :assign_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
         
  def assign_default_role
    self.add_role(:normaluser) if self.roles.blank?
  end

  def admin?
    has_role?(:admin)
  end
end
