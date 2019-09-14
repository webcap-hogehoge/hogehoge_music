class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :product_id, null: false, default: 0
      t.integer :end_user_id, null: false, default: 0
      t.integer :product_number, null: false, default: 0

      t.timestamps
    end
  end
end
