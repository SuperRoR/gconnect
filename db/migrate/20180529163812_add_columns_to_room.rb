class AddColumnsToRoom < ActiveRecord::Migration[5.0]
  def change
    change_column :rooms, :sub_number, :integer, :default => 1
    change_column :rooms, :status, :string, :default => "checkout"
  end
end
