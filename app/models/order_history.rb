class OrderHistory < ApplicationRecord
  validates :end_user_id, presence: true
  validates :last_name_kanji, presence: true
  validates :first_name_kanji, presence: true
  validates :postal_code_1, presence: true
  validates :postal_code_2, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :pay_method, presence: true
  validates :order_status, presence: true
  # validates :subtotal, presence: true
  belongs_to :end_user
  has_many :order_details, dependent: :destroy
end
