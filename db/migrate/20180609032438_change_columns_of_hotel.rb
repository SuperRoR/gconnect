class ChangeColumnsOfHotel < ActiveRecord::Migration[5.0]
  def change
    change_column :hotels, :wevo_pbx_remote_domain, :string, default: "cloudpbx.gconnect.com"
    add_column :hotels, :use_cloud, :boolean, default: true
  end
end
