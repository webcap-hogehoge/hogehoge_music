class ArrivalHistoriesController < ApplicationController
before_action :authenticate_end_user!
before_action :authenticate_administrator!
  def new
  	@product = Product.find(params[:id])
  	@arrival_history = @product.arrival_histories.build
  end

  def create
  	@arrival_history = ArrivalHistory.new(arrival_history_params)
  	@arrival_history.save
  	render("index")
  end

  def index
    @arrival_histories = ArrivalHistory.all
  end

   private
    def arrival_history_params
        params.require(:arrival_history).permit(:arrival_number)
    end
end
