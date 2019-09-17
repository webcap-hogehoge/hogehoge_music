class OrderHistoriesController < ApplicationController
  def new
    @end_user = EndUser.find(1)
    @cart_items = @end_user.cart_items
  end

  def back
    @end_user = EndUser.find(1)
    @cart_items = @end_user.cart_items
    @order_history = OrderHistory.new(order_histories_params)
    render :new
  end


  def update
  end

  def create
    @end_user = EndUser.find(1)
    @cart_items = @end_user.cart_items
    if params[:back]
      render :new

      elsif params[:address] == true
        @order_history = @end_user.order_histories.build(order_histories_params)
        if @order_history.save
          render :thanks
        else
          render :new
        end
      else
        @order_history = @end_user.order_histories.build(last_name_kanji: params['last_name'],
          first_name_kanji: params['first_name'], postal_code_1: params['current_postal_code_1'],
          postal_code_2: params['current_postal_code_2'], address: params['current_address'],
          telephone_number: params['current_telephone_number'], pay_method: params['pay_method'])
        if @order_history.save
          render :thanks
        else
          render :new
        end
      end
  end

  def confirm
    @end_user = EndUser.find(1)
    @cart_items = @end_user.cart_items
     if params[:order_histories_address] == 'new'
      @order_history = @end_user.order_histories.build(last_name_kanji: params[:last_name_kanji],
          first_name_kanji: params[:first_name_kanji], postal_code_1: params[:postal_code_1],
          postal_code_2: params[:postal_code_2], address: params[:address],
          telephone_number: params[:telephone_number], pay_method: params['pay_method'])
      else
        current_address = Address.find(params[:order_histories_address])
        @order_history = @end_user.order_histories.build(last_name_kanji: current_address.last_name,
          first_name_kanji: current_address.first_name, postal_code_1: current_address.postal_code_1,
          postal_code_2: current_address.postal_code_2, address: current_address.address,
          telephone_number: current_address.telephone_number, pay_method: params['pay_method'])
      end
    return :new if @order_history.valid?
  end

  def thanks
  end

  def index
  end

  def show
  end

  private

  def order_histories_params
    params.require(:order_history).permit(:order_histories_address, :last_name_kanji, :first_name_kanji, :postal_code_1, :postal_code_2, :address, :telephone_number, :pay_method)
  end


end
