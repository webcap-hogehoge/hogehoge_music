class Review < ApplicationRecord
  validates :subject, presence: true
  validates :review_body, presence: true
  validates :rating, presence: true
  belongs_to :end_user
  belongs_to :product
