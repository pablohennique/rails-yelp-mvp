puts "Cleaning the db..."
Restaurant.destroy_all

puts "Creating 10 restaurants..."

10.times do
  resto = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: Restaurant::CATEGORIES.sample
  )
  review = Review.create!(
    rating: rand(1..5),
    content: Faker::Restaurant.review,
    restaurant_id: resto.id
  )
  puts "Restaurant with id #{resto.id} was created"
end

puts "All done!"
