class BatchesController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource 

	def index
		@batches = Batch.all
	end

	def new
		@batch = Batch.new
	end

	def show
		if params[:fee]
			batch_student = BatchStudent.find(params[:batch_student].to_i)
			batch_student.update_attributes(fee: params[:fee].to_i)
		end
		
		@batch = Batch.find(params[:id]);
	end

	def create
		@batch = Batch.new(batch_params)
		if @batch.save
			redirect_to batches_path, notice: "Successfully created batch!"
		else
			render action: "new"
		end
	end

	def edit
		@batch = Batch.find(params[:id])
	end

	def update
		@batch = Batch.find(params[:id])
		if @batch.update_attributes(batch_params)
			redirect_to batch_path,notice: "Updated successfully!"
		else
			redirect_to :back
		end
	end

	def payment_mail
		if params[:send_mail]
			batch_student = BatchStudent.find(params[:batch_student].to_i)
			payment_token = "1234fgh"
			PaymentLink.create(batch_student_id: batch_student.id, payment_token: payment_token,amount: params[:request_fee].to_i)
			Notification.request_payment(batch_student,params[:request_fee].to_i,payment_token).deliver
			redirect_to :back
		end
	end

	private

	def batch_params
		params[:batch].permit(:name, :course_id, :start_date, :end_date, user_ids: [])
	end
end
