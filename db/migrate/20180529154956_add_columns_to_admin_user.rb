class AddColumnsToAdminUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :active_admin, :hotel, foreign_key: true, null: true
    add_column :active_admin, :is_super_admin, :boolean, default: false
  end
end
