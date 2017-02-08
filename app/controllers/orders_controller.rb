class OrdersController < ApplicationController
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

  def show
    @order = Order.find_by_id(params[:id])
  end
  
  def index
    @orders = Order.filter(filter_params).page(params[:page]).per(20)
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
