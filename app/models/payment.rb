class Payment < ApplicationRecord
  belongs_to :order
  resourcify
end
