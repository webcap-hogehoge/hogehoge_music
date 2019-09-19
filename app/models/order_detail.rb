class OrderDetail < ApplicationRecord
  validates :product_number, presence: true
  validates :unit_price, presence: true

  belongs_to :order_history
  belongs_to :product
end
