class Order < ActiveRecord::Base
	include OrderConcerns::Razorpay
	belongs_to :installment

  [:authorized, :captured, :refunded, :error].each do |scoped_key|
    scope scoped_key, -> { where('LOWER(status) = ?', scoped_key.to_s.downcase) }
  end

	class << self
	    def process_razorpayment(params)
	      payment_link = PaymentLink.find(params[:payment_link_id])
	      razorpay_pmnt_obj = fetch_payment(params[:payment_id])
	      status = fetch_payment(params[:payment_id]).status
	      if status == "authorized"
	        razorpay_pmnt_obj.capture({amount: payment_link.amount.to_i * 100})
	        razorpay_pmnt_obj = fetch_payment(params[:payment_id])
	        installment = Installment.create(title: "INST-" + payment_link.amount.to_s,amount: payment_link.amount.to_i,batch_student_id: payment_link.batch_student_id)
	        params.merge!({status: razorpay_pmnt_obj.status, price: payment_link.amount.to_i, installment_id: installment.id})
	        params.delete(:payment_link_id)
	        payment_link.update_attributes(is_expired: true)
	        Order.create(params)
	      else
	        raise StandardError, "UNable to capture payment"
	      end
	    end


	    def filter(params)
	      scope = params[:status] ? Order.send(params[:status]) : Order.authorized
	      return scope
	    end
	  end  	
end
