class CreateInstallments < ActiveRecord::Migration
  def change
    create_table :installments do |t|
      t.string :title
      t.integer :user_id
      t.float :amount
      t.boolean :is_paid

      t.timestamps null: false
    end
  end
end
