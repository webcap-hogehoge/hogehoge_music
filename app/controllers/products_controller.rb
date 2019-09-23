class ProductsController < ApplicationController
  def index
  	# @products = Product.all    <!-- ransackによりallが表示されるためコメントアウトしてます -->
    @q = Product.ransack(params[:q])
    if params[:q] != nil
      @products = @q.result(distinct: true)
    else
      @products = Product.active.page(params[:page]).per(35)
    end
  end

  def admin_index
    @products = Product.active.all
  end

  def show
    @q = Product.ransack(params[:q])
  	@products = Product.active.all
  	@product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

  def admin_show
    @product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
  	@disk = @product.disks.build
    @song = @disk.songs.build
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_root_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_root_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.is_deleted = 1
    @product.save
    redirect_to admin_root_path
  end

  private
  def product_params
  	params.require(:product).permit(:image_id, :price, :cd_name,
      :genre_id, :product_status, :label_name, :artist_name, 
      disks_attributes: [:id, :disk_number, :_destroy, songs_attributes: [:id, :song_name, :_destroy]])
  end
end
