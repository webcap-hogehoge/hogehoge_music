class CartItem < ApplicationRecord
  validates :product_id, presence: true
  validates :end_user_id, presence: true
  validates :product_number, presence: true
  belongs_to :product
  belongs_to :end_user
  belongs_to :cart
end
