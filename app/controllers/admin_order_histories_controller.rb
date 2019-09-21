class AdminOrderHistoriesController < ApplicationController
	def admin_index
		@order_histories = OrderHistory.all
		@q = Product.ransack(params[:q])
        @products = @q.result(distinct: true)

	end

	def edit
	end

	def update
	end



end
