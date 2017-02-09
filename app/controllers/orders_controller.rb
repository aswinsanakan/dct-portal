class OrdersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource 

	skip_before_filter :verify_authenticity_token
  
  def payment_status
  	begin
  		@order = Order.process_razorpayment(payment_params)
  		redirect_to :back, notice: "Payment Successfull!"
  	rescue Exception => e
  		puts e.message
  		flash[:alert] = "Unable to process payment."
      	redirect_to :back
  	end
  end

  private

  def payment_params
  	p = params.permit(:payment_id, :payment_link_id, :user_id, :price, :razorpay_payment_id)
  	p.merge!({payment_id: p.delete(:razorpay_payment_id)})
  	p
  end

  def filter_params
    params.permit(:status, :page)
  end



end
