class ProductsController < ApplicationController
before_action :authenticate_end_user!, except: [:admin_index, :admin_show, :create, :new, :edit, :update, :destroy, :show, :index]
before_action :authenticate_administrator!, only: [:admin_index, :admin_show, :create, :new, :edit, :update, :destroy]

  def index
  	# @products = Product.all    <!-- ransackによりallが表示されるためコメントアウトしてます -->
    @q = Product.ransack(params[:q])
    # @q = @q.page(params[:page])
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
    @cart_item.product_id = params[:id]
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

  def login_check
  unless user_signed_in?
    flash[:alert] = "ログインしてください"
    redirect_to new_end_user_registration_path
  end
end
end