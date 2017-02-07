class AddIsExpiredToPaymentLinks < ActiveRecord::Migration
  def change
  	add_column :payment_links, :is_expired, :boolean
  end
end
