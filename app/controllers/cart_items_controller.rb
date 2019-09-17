class CartItemsController < ApplicationController
  def index
  	@products = Product.all
  	@product = Product.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end
  
end
