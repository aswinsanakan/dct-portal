class ChangeColumnInInstallments < ActiveRecord::Migration
  def change
  	add_column :installments, :batch_id, :integer
  end
end
