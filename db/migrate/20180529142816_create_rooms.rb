class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.references :hotel
      t.string :room_number
      t.integer :sub_number
      t.string :status
      t.datetime :from
      t.datetime :to
      t.timestamps
    end
  end
end
