class Order < ApplicationRecord
  belongs_to :user
  resourcify
end
