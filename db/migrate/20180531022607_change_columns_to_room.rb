class ChangeColumnsToRoom < ActiveRecord::Migration[5.0]
  def change
    remove_column :rooms, :to
    add_column :rooms, :days, :integer, :default => 1
    add_column :rooms, :code, :string, :default => ""
    add_index :rooms, :code, unique: true
  end
end
