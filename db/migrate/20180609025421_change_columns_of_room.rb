class ChangeColumnsOfRoom < ActiveRecord::Migration[5.0]
  def change
    change_column :rooms, :sub_number, :integer, :default => 0
    remove_column :rooms, :ext_no
    remove_column :rooms, :ext_password

    add_column :rooms, :ext_phone_type1, :string
    add_column :rooms, :ext_no1, :string
    add_column :rooms, :ext_password1, :string
    add_column :rooms, :ext_device_token_android1, :string
    add_column :rooms, :ext_device_token_ios1, :string

    add_column :rooms, :ext_phone_type2, :string
    add_column :rooms, :ext_no2, :string
    add_column :rooms, :ext_password2, :string
    add_column :rooms, :ext_device_token_android2, :string
    add_column :rooms, :ext_device_token_ios2, :string

  end
end
