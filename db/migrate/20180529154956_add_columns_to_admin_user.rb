class AddColumnsToAdminUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :admin_users, :hotel, foreign_key: true, null: true
    add_column :admin_users, :is_super_admin, :boolean, default: false
  end
end
