class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.integer :product_id, null: false, default: 0
      t.string :label_name, null: false, default: ""

      t.timestamps
    end
  end
end
