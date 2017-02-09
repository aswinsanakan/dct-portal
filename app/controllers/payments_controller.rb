class PaymentsController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource class: :payments

	def index
		@installments = Installment.all.order('created_at DESC')
	end
end
