class User < ApplicationRecord
  rolify
  after_create :assign_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :nullify
  acts_as_voter

  def assign_default_role
    self.add_role(:normaluser) if self.roles.blank?
  end

  def admin?
    has_role?(:admin)
  end

  def self.find_for_facebook_oauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    return user if user
    user = User.where(email: auth.info.email).first
    return user if user
    puts "++++++++#{user} -- auth.info #{auth.info}"
    User.create(
      provider: auth.provider,
      uid: auth.uid,
      email: auth.info.email,
      name: auth.info.name,
      password: Devise.friendly_token[0,20]
    )
  end
end
