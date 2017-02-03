class BatchesController < ApplicationController
	def new
		@batch = Batch.new
	end

	def create
		@batch = Batch.new(batch_params)
		if @batch.save
			redirect_to :back, notice: "Successfully created batch!"
		else
			render action: "new"
		end
	end

	private

	def batch_params
		params[:batch].permit(:name, :course_id, :start_date, :end_date)
	end
end
