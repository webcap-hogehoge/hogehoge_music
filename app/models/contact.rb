class Contact < ApplicationRecord
  validates :end_user_id, presence: true
  validates :subject, presence: true
  validates :contact_body, presence: true
  belongs_to :end_user
end
