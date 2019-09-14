class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def show
  end

  def admin_index
  end
end
