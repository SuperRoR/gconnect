class AddIconToHotel < ActiveRecord::Migration[5.0]
  def change
    add_column :hotels, :message_icon, :string

  end
end
