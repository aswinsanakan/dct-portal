class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :installment_id
      t.integer :price
      t.string :status
      t.string :payment_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
