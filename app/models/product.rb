class Product < ApplicationRecord
mount_uploader :image_id, ImageIdUploader
validates :image_id, presence: true
validates :price, presence: true
validates :product_status, presence: true
validates :cd_name, presence: true
validates :is_deleted, presence: true
# artist_id,label_id のバリデーションはseedデータに追加できたら記載する
# validates :artist_id, presence: true
# validates :label_id, presence: true
has_many :arrival_histories, dependent: :destroy
has_many :cart_items, dependent: :destroy
has_many :disks, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :products, dependent: :destroy
has_many :reviews, dependent: :destroy
has_many :order_details, dependent: :destroy
belongs_to :artist
belongs_to :label


enum product_status:{on_sale: 0, not_on_sale: 1}
# on_sale = 販売中  not_on_sale = 販売停止中


end
