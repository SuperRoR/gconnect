class ChangeColumnsOfAdminUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :admin_users, :is_super_admin, :boolean
    add_column :admin_users, :role, :string, default: "department_manager"
    add_column :admin_users, :department_id, :integer
    add_index :admin_users, :department_id
  end
end
