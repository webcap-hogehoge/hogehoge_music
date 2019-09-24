class OrderHistoriesController < ApplicationController
before_action :authenticate_end_user!
  def new
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @address_info = params[:address_info] if params.presence
    @end_user = current_end_user
    @cart_items = @end_user.cart_items
    @order_history = OrderHistory.new
    # URLにパラメーターがあるならば、パラーメーターの情報を住所入力欄に入れる
     if params.presence
        @order_history.last_name_kanji = params[:last_name_kanji]
        @order_history.first_name_kanji = params[:first_name_kanji]
        @order_history.postal_code_1 = params[:postal_code_1]
        @order_history.postal_code_2 = params[:postal_code_2]
        @order_history.address = params[:address]
        @order_history.telephone_number = params[:telephone_number]
     end
    @end_user_fitst = @end_user.addresses.first
  end

  def back
    @end_user = current_end_user
    @cart_items = @end_user.cart_items
    @order_history = OrderHistory.new(order_histories_params)
    render :new
  end

  def create
    @end_user = current_end_user
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

      if  @order_history.save
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
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @end_user = current_end_user
    @cart_items = @end_user.cart_items
    # わざと一行増やして変数を説明的にすることで見やすくする
    @address_info = params[:order_history][:selected_order_histories_address_id]
    # ストロングパラメーターでデータを受け取る
    para = order_histories_params
    # viewから送られてきたparamsの中にある:order_histories_addressの値で条件分岐
    # newが入ってたら新規作成
    if @address_info == 'address新規登録'
      #全ての値が入っている場合はorder_historyを作成するための箱を用意する
      if para[:last_name_kanji].empty? or para[:first_name_kanji].empty? or para[:telephone_number].empty? or para[:postal_code_1].empty? or para[:postal_code_2].empty? or para[:address].empty?
          redirect_to new_order_history_path(last_name_kanji: para[:last_name_kanji], first_name_kanji: para[:first_name_kanji], telephone_number: para[:telephone_number], postal_code_1: para[:postal_code_1], postal_code_2: para[:postal_code_2], address: para[:address], pay_method: para[:pay_method])
      #上記でない場合はnew画面で入力した情報は入れてnew 画面に戻る
      else
        @order_history = @end_user.order_histories.build(para)

      end
      # 数字だったら（address.id）Addressesテーブルからfind
    else
      selected_address = Address.find(@address_info)
      @order_history = @end_user.order_histories.build(
        last_name_kanji: selected_address.last_name,
        first_name_kanji: selected_address.first_name,
        postal_code_1: selected_address.postal_code_1,
        postal_code_2: selected_address.postal_code_2,
        address: selected_address.address,
        telephone_number: selected_address.telephone_number,
        pay_method: para[:pay_method]
        )
    end
  end

  def thanks
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @end_user = current_end_user
    @order_histories = @end_user.order_histories
  end

  def show
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @order_history = OrderHistory.find(params[:id])
  end

  private

  def order_histories_params
    params.require(:order_history).permit(:last_name_kanji, :first_name_kanji, :postal_code_1, :postal_code_2, :address, :telephone_number, :pay_method)
  end


end
