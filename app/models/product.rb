class Product < ApplicationRecord
mount_uploader :image_id, ImageIdUploader
validates :image_id, presence: true
validates :price, presence: true
validates :product_status, presence: true
validates :cd_name, presence: true
validates :is_deleted, presence: true


enum product_status:{on_sale: 0, not_on_sale: 1}
# on_sale = 販売中  not_on_sale = 販売停止中

end
