class AdminOrderHistoriesController < ApplicationController
	def admin_index
		@order_histories = OrderHistory.all

	end

	def edit
	end

	def update
	end



end
