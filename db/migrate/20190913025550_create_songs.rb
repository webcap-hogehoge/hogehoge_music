class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :disk_id, null: false, default: 0
      t.string :song_name, null: false, default: ""

      t.timestamps
    end
  end
end
