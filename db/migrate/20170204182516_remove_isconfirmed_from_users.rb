class RemoveIsconfirmedFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :is_confirmed
  end
end
