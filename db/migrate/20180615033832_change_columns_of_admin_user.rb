class ChangeColumnsOfAdminUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :admin_users, :is_super_admin, :boolean
    add_column :active_admin, :role, :string, default: "department_manager"
    add_column :active_admin, :department_id, :integer
    add_index :active_admin, :department_id
  end
end
