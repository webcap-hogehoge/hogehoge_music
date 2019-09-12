class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :image_id, null: false
      t.integer :price, null: false
      t.integer :product_status, null: false
      t.string :cd_name, null: false
      t.integer :is_deleted, null: false, default: 0
      t.timestamps
    end
  end
end
