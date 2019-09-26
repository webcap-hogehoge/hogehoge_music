class AdminOrderHistoriesController < ApplicationController
before_action :authenticate_administrator!
	def admin_index
		@order_histories = OrderHistory.all.order(created_at: :desc)
		@q = Product.ransack(params[:q])
        @products = @q.result(distinct: true)

	end

	def edit
	end

	def update
	end



end

#@words = Word.page(params[:page]).per(PER)

