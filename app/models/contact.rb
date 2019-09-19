class Contact < ApplicationRecord
  validates :subject, presence: true
  validates :contact_body, presence: true
  belongs_to :end_user
end
