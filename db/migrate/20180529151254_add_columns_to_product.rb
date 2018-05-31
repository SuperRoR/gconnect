class AddColumnsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :department, foreign_key: true
  end
end
