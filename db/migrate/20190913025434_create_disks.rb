class CreateDisks < ActiveRecord::Migration[5.2]
  def change
    create_table :disks do |t|
      t.integer :product_id, null: false, default: 0
      t.integer :disk_number, null: false, default: 0

      t.timestamps
    end
  end
end
