class OrderHistoriesController < ApplicationController
  def new
    @address_info = params[:address_info] if params.presence
    @end_user = EndUser.find(1)
    @cart_items = @end_user.cart_items
    @order_history = OrderHistory.new
  end

  def back
    @end_user = EndUser.find(1)
    @cart_items = @end_user.cart_items
    @order_history = OrderHistory.new(order_histories_params)
    render :new
  end

  def create
    @end_user = EndUser.find(1)
    @cart_items = @end_user.cart_items
    if params[:back]
      render :new
    else
      @order_history = @end_user.order_histories.build(order_histories_params)
      # @order_history.subtotalはorder_historyテーブルのsubtotalカラムを示すことになるので@order_history.subtotal=0と定義するのはよくないのでsubtotal=0とする
      subtotal = 0
      @cart_items.each do |cart_item|
          unit_price = cart_item.product.price
          subtotal += unit_price * cart_item.product_number
      end
      @order_history.tax = subtotal * 0.08
      @order_history.delivery_fee = 500
      @order_history.subtotal = subtotal
      @order_history.total_price = @order_history.subtotal + @order_history.tax + @order_history.delivery_fee


      if @order_history.save
        @cart_items.each do |cart_item|
          @order_detail = OrderDetail.new
          @order_detail.order_history_id = @order_history.id
          @order_detail.product_id = cart_item.product_id
          @order_detail.product_number = cart_item.product_number
          @order_detail.unit_price = cart_item.product.price
          @order_detail.save
          # 実装前にコメントアウト外すこと！！！！！！！
          #cart_item.destroy
        end
         redirect_to order_histories_thanks_path
      end
    end
  end

  def confirm
    @end_user = EndUser.find(1)
    @cart_items = @end_user.cart_items
    # わざと一行増やして変数を説明的にすることで見やすくする
    @address_info = params[:order_history][:selected_order_histories_address_id]
    # viewから送られてきたparamsの中にある:order_histories_addressの値で条件分岐
    # newが入ってたら新規作成
    if @address_info == 'address新規登録'

      @order_history = @end_user.order_histories.build(order_histories_params)
    # 数字だったら（address.id）Addressesテーブルからfind
    else
      selected_address = Address.find(@address_info)
      @order_history = @end_user.order_histories.build(last_name_kanji: selected_address.last_name,
        first_name_kanji: selected_address.first_name, postal_code_1: selected_address.postal_code_1,
        postal_code_2: selected_address.postal_code_2, address: selected_address.address,
        telephone_number: selected_address.telephone_number, pay_method: order_histories_params[:pay_method])
    end
    # valid?はヴァリデーションを判定するメソッド。
    return :new if @order_history.valid?
  end

  def thanks
  end

  def index
    @end_user = EndUser.find(1)
    @order_histories = @end_user.order_histories
  end

  def show
    @order_history = OrderHistory.find(params[:id])
  end

  private

  def order_histories_params
    params.require(:order_history).permit(:last_name_kanji, :first_name_kanji, :postal_code_1, :postal_code_2, :address, :telephone_number, :pay_method)
  end


end
