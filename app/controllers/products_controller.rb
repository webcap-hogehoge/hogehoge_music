class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def show
  end

  def product_params
  	params.require(:product).permit(:image_id, :price, :price_status, :cd_name, :is_deleted)
  end
end
