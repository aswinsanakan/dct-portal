class HomeController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource class: :home

  def index
  end

  def my_batches
  	@batches = current_user.batches
  end

  def my_payments
  	@installments = current_user.installments

  end
end
