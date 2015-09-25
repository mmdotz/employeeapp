# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

employee = Employee.create({
    name:           "Michelle Dotzenrod"
    dept:           "Engineering"
    yrs_employed:    17
    position:       "Headmistress"
    status:         "part-time"
    pay:            "salary"
  })

