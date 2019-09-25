class ArrivalHistoriesController < ApplicationController
before_action :authenticate_administrator!
  def new
  	@product = Product.find(params[:id])
  	@arrival_history = @product.arrival_histories.build
  end

  def create
    @product = Product.find(params[:arrival_history][:product_id])
  	@arrival_history = @product.arrival_histories.build(arrival_history_params)
  	if @arrival_history.save
  	   redirect_to arrival_histories_path
       flash[:notice] = "在庫追加完了しました"
    else
      render("new")
    end
  end

  def index
    @arrival_histories = ArrivalHistory.all.order(id: "DESC")
  end

   private
    def arrival_history_params
        params.require(:arrival_history).permit(:arrival_number)
    end
end
