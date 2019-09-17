class Address < ApplicationRecord
  # validates :end_user_id, presence: true
  validates :postal_code_1, presence: true, length: { is: 3 }
  validates :postal_code_2, presence: true, length: { is: 4 }
  validates :address, presence: true
  validates :telephone_number, presence: true
  # validates :last_name, presence: true
  # validates :first_name, presence: true
  validates :is_main, presence: true

  belongs_to :end_user
end
