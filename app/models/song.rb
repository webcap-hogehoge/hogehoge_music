class Song < ApplicationRecord
  validates :song_name, presence: true
  belongs_to :disk
end
