class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :wevo_user_id, null: false
      t.string :status, null: false, default: "PENDING"
      t.integer :assignee_id

      t.timestamps
    end
  end
end
