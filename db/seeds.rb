puts "Seeding Employees..."
1.upto(5) do |i|
    Employee.create!(email: "emp#{i}@rera.com", password: 'zaq123', number_of_available_kudos: Faker::Number.between(from: 1, to: 10))
end
puts "Done."

puts "Seeding Admins..."
    AdminUser.create!(email: "admin@rera.com", password: 'zaq123')
puts "Done."

puts "Seeding Kudos..."
5.times do
    Kudo.create!(title: Faker::Superhero.name, content: Faker::TvShows::Friends.quote, giver_id: Faker::Number.between(from: 1, to: 5), receiver_id: Faker::Number.between(from: 1, to: 5))
end
puts "Done."

puts "Seeding Company Values..."
    CompanyValue.create!(title: 'Honesty')
    CompanyValue.create!(title: 'Ownership')
    CompanyValue.create!(title: 'Accountability')
    CompanyValue.create!(title: 'Passion')
puts "Done."
