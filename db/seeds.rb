puts "Seeding Employees..."
1.upto(10) do |i|
    Employee.create!(email: "emp#{i}@rera.com", password: 'zaq123', number_of_available_kudos: rand(1..10))
end
puts "Done. Created #{Employee.count} Employees"

puts "Seeding Admins..."
    AdminUser.create!(email: "admin@rera.com", password: 'zaq123')
puts "Done."

puts "Seeding Company Values..."
    CompanyValue.create!(title: 'Honesty')
    CompanyValue.create!(title: 'Ownership')
    CompanyValue.create!(title: 'Accountability')
    CompanyValue.create!(title: 'Passion')
puts "Done. Created #{CompanyValue.count} Company Values"

puts "Seeding Kudos..."
10.times do
    Kudo.create!(   title: Faker::Superhero.name, 
                    content: Faker::TvShows::Friends.quote, 
                    giver_of_kudo: Employee.all.sample, 
                    receiver_of_kudo: Employee.all.sample,
                    company_value: CompanyValue.all.sample)
end
puts "Done. Created #{Kudo.count} Kudos"
