class AddSlugToHotel < ActiveRecord::Migration[5.0]
  def change
    add_column :hotels, :slug, :string, unique: true
    add_index :hotels, :slug
  end
end
