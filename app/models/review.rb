class Review < ApplicationRecord
  validates :product_id, presence: true
  validates :end_user_id, presence: true
  validates :subject, presence: true
  validates :review_body, presence: true
  validates :rating, presence: true
  belongs_to :end_user
  belongs_to :product
