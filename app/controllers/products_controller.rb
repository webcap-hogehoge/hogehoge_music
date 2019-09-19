class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def admin_index
    @products = Product.all
  end

  def show
  	@products = Product.all
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
  	@product.disks.build
  end

  def create
    @product = Product.build(product_params)
    @product.save
    render("admin_index")
  end

  private
  def product_params
  	params.require(:product).permit(:image_id, :price, :cd_name, :product_status, :label_id, :artist_id, disks_attributes: [:disk_number])
  end
end
