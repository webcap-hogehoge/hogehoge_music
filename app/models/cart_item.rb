class CartItem < ApplicationRecord
  validates :product_number, presence: true
  belongs_to :product
  belongs_to :end_user
end
