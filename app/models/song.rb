class Song < ApplicationRecord
  validates :disk_id, presence: true
  validates :song_name, presence: true
  belongs_to :disk
end
