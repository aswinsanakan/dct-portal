class UsersController < ApplicationController
	before_action :authenticate_user!

	load_and_authorize_resource

	def index
		@users = []
		User.all.each do |user|
			if user.roles.first.name == "student"
				@users.push(user)
			end
		end
	end	

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			Notification.user_registered(@user).deliver
			redirect_to users_path, notice: "Successfully created user!"
		else
			render action: "new"
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to users_path, notice: "Updated Successfully!"
		else
			render action: "edit"
		end
	end

	def destroy
		@user = User.find(params[:id])
		@permission = Permission.all.where('user_id = ?',@user.id).first
		@batch_students = BatchStudent.all.where('user_id = ?',@user.id)
		@user.destroy
		@permission.destroy
		@batch_students.delete_all

		redirect_to users_path, notice: "Deleted successfully!" 
	end


	private

	def user_params
		params[:user].permit(:name, :email, :password)
	end
end
