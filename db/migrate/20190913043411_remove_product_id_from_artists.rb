class RemoveProductIdFromArtists < ActiveRecord::Migration[5.2]
  def up
    remove_column :artists, :product_id
  end

  def down
    add_column :artists, :product_id, :integer, null: false, default: 0
  end
end
