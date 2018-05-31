class AddColumnsToHotel < ActiveRecord::Migration[5.0]
  def change
    add_column :hotels, :wevo_pbx_local_domain, :string
    add_column :hotels, :wevo_pbx_remote_domain, :string
  end
end
