# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Employees table seeding..."

employee = Employee.new
employee.email = 'emp1@rera.com'
employee.password = 'zaq123'
employee.password_confirmation = 'zaq123'
employee.save!

employee = Employee.new
employee.email = 'emp2@rera.com'
employee.password = 'zaq123'
employee.password_confirmation = 'zaq123'
employee.save!

employee = Employee.new
employee.email = 'emp3@rera.com'
employee.password = 'zaq123'
employee.password_confirmation = 'zaq123'
employee.save!

employee = Employee.new
employee.email = 'emp4@rera.com'
employee.password = 'zaq123'
employee.password_confirmation = 'zaq123'
employee.save!

employee = Employee.new
employee.email = 'emp5@rera.com'
employee.password = 'zaq123'
employee.password_confirmation = 'zaq123'
employee.save!

puts "Employees table seeding done"

puts "Kudos table seeding..."

5.times do
    kudo = Kudo.new
    kudo.title = Faker::Superhero.name
    kudo.content = Faker::TvShows::Friends.quote
    kudo.giver_id = Faker::Number.between(from: 1, to: 10)
    kudo.receiver_id = Faker::Number.between(from: 1, to: 10)
    kudo.save!
end

puts "Kudos table seeding done"