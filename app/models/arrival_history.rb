class ArrivalHistory < ApplicationRecord
  validates :arrival_number, presence: true
  belongs_to :product
end
