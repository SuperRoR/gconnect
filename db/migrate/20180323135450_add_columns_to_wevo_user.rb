class AddColumnsToWevoUser < ActiveRecord::Migration[5.0]
  def change
    add_column :wevo_users, :role_id, :integer
    rename_column :wevo_users, :secret, :auth_token
  end
end
