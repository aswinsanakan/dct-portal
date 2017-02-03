class CreateBatchStudents < ActiveRecord::Migration
  def change
    create_table :batch_students do |t|
      t.integer :batch_id
      t.integer :user_id
      t.float :fee

      t.timestamps null: false
    end
  end
end
