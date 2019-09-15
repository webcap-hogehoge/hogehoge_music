class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :product_id, null: false, default: 0
      t.integer :end_user_id, null: false, default: 0
      t.string :subject, null: false, default: ""
      t.text :review_body, null: false, default: ""
      t.float :rating, null: false, default: 0

      t.timestamps
    end
  end
end
