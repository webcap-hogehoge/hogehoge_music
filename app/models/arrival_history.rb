class ArrivalHistory < ApplicationRecord
  validates :product_id, presence: true
  validates :arrival_number, presence: true
  belongs_to :product
end
