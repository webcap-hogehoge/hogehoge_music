class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :end_user_id, null: false, default: 0
      t.integer :product_id, null: false, default: 0

      t.timestamps
    end
  end
end
