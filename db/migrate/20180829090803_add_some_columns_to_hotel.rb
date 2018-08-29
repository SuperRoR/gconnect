class AddSomeColumnsToHotel < ActiveRecord::Migration[5.0]
  def change
    add_column :hotels, :manager_ext_no, :string
    add_column :hotels, :site_url, :string

  end
end
