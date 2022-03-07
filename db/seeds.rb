puts "Employees table seeding..."
1.upto(5) do |i|
    Employee.create!(email: "emp#{i}@rera.com", password: 'zaq123')
end
puts "Employees table seeding done"

puts "Admins table seeding..."
    AdminUser.create!(email: "admin@rera.com", password: 'zaq123')
puts "Admins table seeding done"

puts "Kudos table seeding..."
5.times do
    Kudo.create!(title: Faker::Superhero.name, content: Faker::TvShows::Friends.quote, giver_id: Faker::Number.between(from: 1, to: 5), receiver_id: Faker::Number.between(from: 1, to: 5))
end
puts "Kudos table seeding done"
