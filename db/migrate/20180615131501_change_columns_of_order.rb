class ChangeColumnsOfOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :status, :string
    add_column :orders, :status, :string, null: false, default: "pending"
  end
end
