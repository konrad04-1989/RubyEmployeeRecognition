puts "Employees table seeding..."

1.upto(5) do |i|
    employee = Employee.new
    employee.email = "emp#{i}@rera.com"
    employee.password = 'zaq123'
    employee.password_confirmation = 'zaq123'
    employee.save!
end

puts "Employees table seeding done"

puts "Admins table seeding..."
    admin = Admin.new
    admin.email = "admin@rera.com"
    admin.password = 'zaq123'
    admin.password_confirmation = 'zaq123'
    admin.save!
puts "Admins table seeding done"

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
