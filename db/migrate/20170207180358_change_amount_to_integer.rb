class ChangeAmountToInteger < ActiveRecord::Migration
  def change
  	change_column :installments, :amount, :integer 
  	change_column :payment_links, :amount, :integer
  	change_column :batch_students, :fee, :integer
  end
end
