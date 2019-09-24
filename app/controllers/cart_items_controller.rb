class CartItemsController < ApplicationController
before_action :authenticate_end_user!
  def index
  	@products = Product.all
    @cart_items = current_end_user.cart_items.all
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_items = CartItem.where(end_user_id:current_end_user.id).where(product_id:cart_item.product_id)
    product_number = cart_item.product_number
    if cart_items.length == 0
        cart_item.end_user_id = current_end_user.id
    else
      cart_item = cart_items.first
      cart_item.product_number += product_number
    end
    cart_item.save
    redirect_to cart_items_path
  end

  def edit
    @cart_item = CartItem.find(params[:id])
  end

  def update
    cart_item = CartItem.find(params[:id])
      cart_item.update(cart_item_params)
      redirect_to cart_items_path(cart_item.id)
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

private
  def cart_item_params
      params.require(:cart_item).permit(:product_number,:product_id)
  end
end