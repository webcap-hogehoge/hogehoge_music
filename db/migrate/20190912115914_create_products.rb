class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :image_id, null: false, default: ""
      t.integer :price, null: false, default: 0
      t.integer :product_status, null: false, default: 0
      t.string :cd_name, null: false, default: ""
      t.integer :is_deleted, null: false, default: 0
      t.timestamps
    end
  end
end
