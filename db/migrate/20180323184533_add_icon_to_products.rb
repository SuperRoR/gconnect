class AddIconToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :icon, :string
  end
end
