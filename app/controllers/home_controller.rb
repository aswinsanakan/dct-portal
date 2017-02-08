class HomeController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource class: :home

  def index
  end

  def my_batches
  	@batches = current_user.batches
    @batch_students = current_user.batch_students
  end

  def my_payments
  	@installments = []
    current_user.batch_students.each do |batch_student|
      @installments.push(batch_student.installments)
    end

  end
end
