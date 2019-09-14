class OrderHistoriesController < ApplicationController
  def new
    @end_user = EndUser.find(1)
    @cart_items = @end_user.cart_items
    @order_history = OrderHistory.new

    @cart_items.each do |item|
      @item_unit_price = (item.product_number * item.product.price) * 1.08
    end

  end

  def confirm
  end

  def thanks
  end

  def index
  end

  def show
  end
end
