class CreatePaymentLinks < ActiveRecord::Migration
  def change
    create_table :payment_links do |t|
      t.integer :batch_student_id
      t.string :payment_token
      t.float :amount

      t.timestamps null: false
    end
  end
end
