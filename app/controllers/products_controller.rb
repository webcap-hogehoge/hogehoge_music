class ProductsController < ApplicationController
  def index
  	# @products = Product.all    <!-- ransackによりallが表示されるためコメントアウトしてます -->
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  def show
  	@products = Product.all
  	@product = Product.find(params[:id])
  end

  def admin_show
    @product = Product.find(params[:id])
  end

  def admin_index
  end

  def new
  	@product = Product.new
  	@product.labels.build
  	@product.genres.build
  	@product.artusts.build
  	@product.disks.build
  end

  private
  def product_params
  	params.require(:product).permit(:image_id, :price, :cd_name, :product_status, artists_attributes: [:artist_name],
                                      genres_attributes: [:genre_name], labels_attributes: [:label_name],
                                      disks_attributes: [:disk_number], arrival_histories: [:arrival_number])
  end
end
