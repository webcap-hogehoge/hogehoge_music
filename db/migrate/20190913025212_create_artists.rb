class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.integer :product_id, null: false, default: 0
      t.string :artist_name, null: false, default: ""

      t.timestamps
    end
  end
end
