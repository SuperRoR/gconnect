class AddExtNoAndPasswordToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :ext_no, :string
    add_column :rooms, :ext_password, :string
  end
end
