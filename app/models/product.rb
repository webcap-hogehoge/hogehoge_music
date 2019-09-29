class Product < ApplicationRecord
mount_uploader :image_id, ImageIdUploader
validates :image_id, presence: true
validates :price, presence: true
validates :product_status, presence: true
validates :cd_name, presence: true
validates :is_deleted, presence: true
validates :artist_name, presence: true
validates :label_name, presence: true
#validates :genre_id, presence: true
#validates :disks, associated: true


# artist_id,label_id のバリデーションはseedデータに追加できたら記載する
has_many :arrival_histories, dependent: :destroy
has_many :cart_items, dependent: :destroy
has_many :disks, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :reviews, dependent: :destroy
has_many :order_details, dependent: :destroy

accepts_nested_attributes_for :disks, allow_destroy: true
# belongs_to :artist
# belongs_to :label
belongs_to :genre



enum product_status:{on_sale: 0, not_on_sale: 1}
# on_sale = 販売中  not_on_sale = 販売停止中

scope :active, -> {where(is_deleted: 0) }

def stock(product_id)

  arrival_histories = ArrivalHistory.where(product_id: product_id)
  arrival_count = 0
  arrival_histories.each do |arrival_history|
    arrival_count += arrival_history.arrival_number
  end

  order_details = OrderDetail.where(product_id: product_id)
  order_count = 0
  order_details.each do |order_detail|
    order_count += order_detail.product_number
  end

  stock = arrival_count - order_count
end


end
