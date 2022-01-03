# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Employees table seeding..."

1.upto(5) do |i|
    employee = Employee.new
    employee.email = "emp#{i}@rera.com"
    employee.password = 'zaq123'
    employee.password_confirmation = 'zaq123'
    employee.save!
end

puts "Employees table seeding done"

puts "Kudos table seeding..."

5.times do
    kudo = Kudo.new
    kudo.title = Faker::Superhero.name
    kudo.content = Faker::TvShows::Friends.quote
    kudo.giver_id = Faker::Number.between(from: 1, to: 5)
    kudo.receiver_id = Faker::Number.between(from: 1, to: 5)
    kudo.save!
end

puts "Kudos table seeding done"
