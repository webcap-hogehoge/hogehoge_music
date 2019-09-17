class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :end_user_id, null: false, default: 0
      t.string :subject, null: false, default: ""
      t.text :contact_body, null: false, default: ""

      t.timestamps
    end
  end
end
