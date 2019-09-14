class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :end_user_id, null: false, default: 0
      t.string :postal_code_1, null: false, default: "000", limit: 3
      t.string :postal_code_2, null: false, default: "0000", limit: 4
      t.string :address, null: false, default: ""
      t.string :telephone_number, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :first_name, null: false, default: ""
      t.integer :is_main, null: false, default: 0

      t.timestamps
    end
  end
end