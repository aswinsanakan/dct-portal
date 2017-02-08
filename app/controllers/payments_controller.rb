class PaymentsController < ApplicationController

	def index
		@installments = Installment.all.order('created_at DESC')
	end
end
