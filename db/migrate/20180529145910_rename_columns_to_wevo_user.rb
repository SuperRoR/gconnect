class RenameColumnsToWevoUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :wevo_users, :role_id, :integer
    add_reference :wevo_users, :room, foreign_key: true
  end
end
