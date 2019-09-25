class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

         has_many :addresses, dependent: :destroy
         accepts_nested_attributes_for :addresses

         has_many :cart_items, dependent: :destroy
         has_many :contacts, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :order_histories, dependent: :destroy
         has_many :reviews, dependent: :destroy
         scope :active, -> { where(is_deleted: 0) }  #削除フラグ

        #  def find_for_authenticate(contication)
        #   binding.pry
        #   super(contication.merge(is_deleted: 0))
        # end
end
