class CartItemsController < ApplicationController
  def index
  	@products = Product.all
  end

  def create
  end

  def update
  end

  def destroy
  end
  
end
