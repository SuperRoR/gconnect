class AddColumnsToDepartment < ActiveRecord::Migration[5.0]
  def change
    add_reference :departments, :hotel, foreign_key: true
  end
end
