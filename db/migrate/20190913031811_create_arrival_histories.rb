class CreateArrivalHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :arrival_histories do |t|
      t.integer :product_id, null: false, default: 0
      t.integer :arrival_number, null: false, default: 0

      t.timestamps
    end
  end
end
