class CreateWevoUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :wevo_users do |t|
      t.integer :wevo_server_id
      t.string :email, null: false
      t.string :user_display_name
      t.string :phone_number, null: false
      t.boolean :is_verified, null: false, default: false
      t.string :extension
      t.string :secret
      t.string :wevopbx_domain
      t.string :wevopbx_local_domain
      t.string :remember_token

      t.timestamps
    end
  end
end
