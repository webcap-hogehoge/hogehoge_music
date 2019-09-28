class OrderHistoriesController < ApplicationController
before_action :authenticate_end_user!, only: [:new, :back, :create, :confirm, :correct_user, :thanks, :index, :show]
before_action :authenticate_administrator!, only: [:edit, :update]
before_action :correct_user, only: [:new, :confirm, :thanks]

#  クラス変数を定義、order_historyクラス内で使用できる。アクションをまたいで使用したい時に使う。まずは0を代入（０は購入されていない）
@@buy_status = 0

  def new
    @end_user = current_end_user
    @cart_items = @end_user.cart_items
      @address_info = params[:address_info] if params.presence
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
      #在庫数が０以下にならないためにするためのコード
      message = []

        @cart_items.each do |cart_item|
          product = Product.find(cart_item.product.id)
          stock = product.stock(product.id) - cart_item.product_number
          if stock < 0
            message << "#{product.cd_name}の在庫が#{product.stock(product.id)}個しかありません。"
          end
        end
        if !message.empty?
          join_message = message.join
          flash[:notice] = "申し訳ございません。#{join_message}購入個数を変更してください。"
          redirect_to cart_items_path
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

          # 登録済みでない住所に送付の場合はaddressに登録する
          @address_info = params[:order_history][:selected_order_histories_address_id]

            if @address_info == 'address新規登録'
              @address = Address.new
              @address.end_user_id = current_end_user.id
              @address.last_name = @order_history.last_name_kanji
              @address.first_name = @order_history.first_name_kanji
              @address.postal_code_1 = @order_history.postal_code_1
              @address.postal_code_2 = @order_history.postal_code_2
              @address.address = @order_history.address
              @address.telephone_number = @order_history.telephone_number
              @address.is_main = 0
              @address.save
            end

          @order_history.save
            @cart_items.each do |cart_item|
              @order_detail = OrderDetail.new
              @order_detail.order_history_id = @order_history.id
              @order_detail.product_id = cart_item.product_id
              @order_detail.product_number = cart_item.product_number
              @order_detail.unit_price = cart_item.product.price
              @order_detail.save
              cart_item.destroy
            end
          # 変数に1を代入する、その後corrrect_userがカートに商品が存在しない場合　＋　buy_status=1であるならば　トップ画面には遷移させないようにするため
          # （上記と逆の場合はトップ画面に遷移させたいため）
          @@buy_status = 1
          redirect_to order_histories_thanks_path
        end

    end
  end

  def confirm
    @end_user = current_end_user
    @cart_items = @end_user.cart_items
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

  # カートアイテムに商品が入っていないときはルートパスに戻るための記述
  def correct_user
    @cart_items = current_end_user.cart_items
    if @cart_items.blank? && @@buy_status != 1
      redirect_to root_path
    end
  end

  def thanks
    @end_user = current_end_user
    @cart_items = @end_user.cart_items
    #thanksページに飛んだらbuy_statusを0に戻すことによって、order_histories/thanksページに直で行ってもルートパスに戻るようにしている
    if @@buy_status == 1
      @@buy_status = 0
    end
  end

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @end_user = current_end_user
    @order_histories = @end_user.order_histories.page(params[:page]).per(15).order('id DESC')
  end

  def show
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @order_history = OrderHistory.find(params[:id])
  end

  def edit
    @order_history = OrderHistory.find(params[:id])
  end

  def update
    order_history = OrderHistory.find(params[:id])
    order_history.update!(order_history_status_params)
    redirect_to admin_order_histories_path
  end

  private

  def order_histories_params
    params.require(:order_history).permit(:last_name_kanji, :first_name_kanji, :postal_code_1, :postal_code_2, :address, :telephone_number, :pay_method)
  end

  def order_history_status_params
    params.require(:order_history).permit(:order_status)
  end


end
