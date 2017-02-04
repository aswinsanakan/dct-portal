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

	private

	def batch_params
		params[:batch].permit(:name, :course_id, :start_date, :end_date, user_ids: [])
	end
end
