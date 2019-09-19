class OrderHistory < ApplicationRecord
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
  enum order_status:{accepting: 0, preparing: 1, finished: 2}   # accepting = 受付中 preparing = 出荷準備中 finished = 出荷済
  enum pay_method:{bank: 0, card: 1, cash:2}
end

