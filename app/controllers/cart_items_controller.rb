class CartItemsController < ApplicationController
  def index
  	@products = Product.all
    @cart_items = current_end_user.cart_items.all
  end

  def create
  end

  def update
  end

  def destroy
  end

end
