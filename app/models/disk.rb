class Disk < ApplicationRecord
  validates :disk_number, presence: true
  belongs_to :product
  has_many :songs, dependent: :destroy
  validates :songs, associated: true

  accepts_nested_attributes_for :songs, allow_destroy: true
end
