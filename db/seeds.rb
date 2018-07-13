# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'superadmin@gconnect.com', password: 'password123', password_confirmation: 'password123', role: :super_admin) if Rails.env.development?
hotel_1 = Hotel.create!(name: "Hotel 1", description: "example hotel one")
hotel_2 = Hotel.create!(name: "Hotel 2", description: "example hotel two")
[hotel_1, hotel_2].each_with_index do |hotel, index|
  hotel.rooms.create!([
                        {room_number: "101", sub_number: 1, status: "checkout", code: SecureRandom.uuid},
                        {room_number: "102", sub_number: 1, status: "checkout", code: SecureRandom.uuid},
                      ])
  hotel.departments.create!([
                            {name: "HouseKeeping"},
                            {name: "Resturant"},
                           ])
  hotel.departments.find_by(name: "HouseKeeping").products.create!([
                      {name: "Shampoo", category_id: 1, price: 6, amount: 100},
                      {name: "Soup", category_id: 1, price: 2, amount: 65},
                      {name: "Towel", category_id: 1, price: 2, amount: 200},
                      {name: "Rinse", category_id: 1, price: 7, amount: 30},
                      {name: "Tissue", category_id: 1, price: 4, amount: 87}
                  ])

  hotel.admin_users.create!(email: "hoteladmin_#{index+1}@gconnect.com", password: 'password123', password_confirmation: 'password123', role: :hotel_admin) if Rails.env.development?
end
