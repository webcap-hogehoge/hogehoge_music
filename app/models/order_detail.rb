class OrderDetail < ApplicationRecord
  validates :order_history_id, presence: true
  validates :product_id, presence: true
  validates :product_number, presence: true
  validates :unit_price, presence: true
  belongs_to :order_history
  belongs_to :product
end
