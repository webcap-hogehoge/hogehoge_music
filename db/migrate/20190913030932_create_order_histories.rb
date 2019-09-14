class CreateOrderHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :order_histories do |t|
      t.integer :end_user_id, null: false, default: 0
      t.string :last_name_kanji
      t.string :first_name_kanji
      t.string :postal_code_1
      t.string :postal_code_2
      t.string :address
      t.string :telephone_number
      t.integer :pay_method
      t.integer :order_status, default: 0
      t.integer :subtotal

      t.timestamps
    end
  end
end
