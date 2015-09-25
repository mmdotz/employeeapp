# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

15.times do
 employee = Employee.new({
   name: Faker::Name.name,
   dept: Faker::Commerce.department,
   yrs_employed: Faker::Number.number(2),
   position: ['secretary', 'accountant', 'manager', 'analyst'].sample,
   status: ['full-time', 'part-time'].sample,
   pay: ['hourly', 'salary'].sample
   })

 employee.vacations.build({
   date_taken: Faker::Date.backward(3650)
   days_left: (0..14).sample
   })
end
