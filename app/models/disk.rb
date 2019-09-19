class Disk < ApplicationRecord
  validates :disk_number, presence: true
  belongs_to :product
  has_many :songs, dependent: :destroy
end
