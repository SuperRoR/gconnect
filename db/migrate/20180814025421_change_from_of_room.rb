class ChangeFromOfRoom < ActiveRecord::Migration[5.0]
  def change
    change_column :rooms, :from, :date

  end
end
