class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
	add_column :users, :is_confirmed, :boolean	
  end
end
