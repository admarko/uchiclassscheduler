# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
Course.destroy_all
f = open(Rails.root.join("classes.json")).read
d = JSON.parse(f)
d.each do |k|
  temp = k.first.split(' ')
  Course.create(name: k.last["name"], dept_code: temp.last, department: temp.first)
end
Course.create(name: "Application Development", dept_code: "33610", department: "BUSN")
