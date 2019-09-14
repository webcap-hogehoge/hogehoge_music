class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_history_id, null: false, default: 0
      t.integer :product_id, null: false, default: 0
      t.integer :product_number, null: false, default: 0
      t.integer :unit_price, null: false, default: 0

      t.timestamps
    end
  end
end
