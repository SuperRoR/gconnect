class RenameRoleToDepartment < ActiveRecord::Migration[5.0]
  def change
    rename_column :roles, :role_name, :name
    rename_table :roles, :departments
  end
end
