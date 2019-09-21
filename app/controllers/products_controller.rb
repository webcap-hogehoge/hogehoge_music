class ProductsController < ApplicationController
  def index
  	# @products = Product.all    <!-- ransackによりallが表示されるためコメントアウトしてます -->
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
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
  	@disk = @product.disks.build
    @song = @disk.songs.build
  end

  def create
    @product = Product.build(product_params)
    @product.save
    render("admin_index")
  end

  private
  def product_params
  	params.require(:product).permit(:image_id, :price, :cd_name, :product_status, :label_id, :artist_id, 
      disks_attributes: [:id, :disk_number, :_destroy, songs_attributes: [:id, :song_name, :_destroy]])
  end
end
