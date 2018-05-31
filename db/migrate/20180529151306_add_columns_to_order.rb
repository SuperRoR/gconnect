class AddColumnsToOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :wevo_user_id, :integer
    remove_column :orders, :assignee_id, :integer
    add_reference :orders, :room, foreign_key: true
  end
end
