# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dates = []
100.times do
 dates.push(Faker::Date.between(10.years.ago, Date.today))
end

15.times do
 employee = Employee.create({
   name:          Faker::Name.name,
   dept:          Faker::Commerce.department,
   yrs_employed:  Faker::Number.number(2),
   position:      ['secretary', 'accountant', 'manager', 'analyst'].sample,
   status:        ['full-time', 'part-time'].sample,
   pay:           ['hourly', 'salary'].sample,
   days_left:     Faker::Number.between(0, 14).to_s
   })

  [1, 2, 3, 4].sample.times do Vacation.create({
   date_taken:    dates.sample.strftime("%m/%d/%y"),
   employee_id:   employee.id
   })
  end
end
