class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :image_id, null: false, default: ""
      t.integer :price, null: false, default: 0
      t.integer :product_status, null: false, default: 0
      t.string :cd_name, null: false, default: ""
      t.integer :is_deleted, null: false, default: 0
      t.string :label_name
      t.string :artist_name
      t.integer :genre_id
      t.timestamps
    end
  end
end
