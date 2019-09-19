class AddDeliveryFeeToOrderHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :order_histories, :tax, :integer
    add_column :order_histories, :delivery_fee, :integer
    add_column :order_histories, :total_price, :integer
  end
end
