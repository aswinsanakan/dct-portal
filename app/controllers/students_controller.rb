class StudentsController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource class: :students

  def index
  	@students = []
  	User.all.each do |user|
  		if user.roles.first.name == "student"
  			@students.push(user)
  		end
  	end
  	@batches = Batch.all
  	@students_confirmed = User.all.where('is_confirmed = ?', true)
  	@students_not_confirmed = User.all.where('is_confirmed = ?', false)  	
  end
end
