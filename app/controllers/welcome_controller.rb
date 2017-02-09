class WelcomeController < ApplicationController
  def index
    if current_user.nil?
      redirect_to new_user_session_path
    elsif current_user.role? "student"
      redirect_to '/home/my_batches'
    else
      redirect_to '/admin/batches'
    end
  end
end
