class Like < ApplicationRecord
  validates :end_user_id, presence: true
  validates :product_id, presence: true
  belongs_to :end_user
  belongs_to :product
end
