class RemoveColumnsFromUsersInstallmentsCourses < ActiveRecord::Migration
  def change
  	remove_column :users, :is_paid
  	remove_column :installments, :is_paid
  	remove_column :installments, :batch_id
  	remove_column :installments, :user_id
  	add_column :installments, :batch_student_id, :integer
  	remove_column :courses, :fee
  end
end
