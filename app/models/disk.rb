class Disk < ApplicationRecord
  validates :product_id, presence: true
  validates :disk_number, presence: true
  belongs_to :product
  has_many :songs, dependent: :destroy
end
