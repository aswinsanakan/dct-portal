class PaymentLinksController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource

  def index
  	if params[:payment_token]
  		@payment_link = PaymentLink.find_by_payment_token(params[:payment_token])
  		@batch_student = @payment_link.batch_student
  	end
  end

  def payment_complete
  	if params[:authorized]
  		
  	end
  end

end
