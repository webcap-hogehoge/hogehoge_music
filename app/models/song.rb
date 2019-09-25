class Song < ApplicationRecord
  validates :song_name, length: {minimum: 1}
  belongs_to :disk
end
