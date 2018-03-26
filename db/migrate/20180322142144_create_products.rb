class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :category_id
      t.integer :price, null: false
      t.integer :amount, null: false, default: 0

      t.timestamps
    end
  end
end
