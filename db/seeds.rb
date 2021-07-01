# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Campaign.destroy_all
User.destroy_all

vitor = User.create(
  email: "vitor@hikeasy.fit",
  password: "123456",
  username: "vitor",
  status: "qualified",
  profession: "engineer",
  service: "mentor",
  role: "expert"
)

anna = User.create(
  email: "anna@hikeasy.fit",
  password: "123456",
  username: "anna",
  status: "not_qualified",
  profession: "junior",
  service: "learner",
  role: "novice"
)

Campaign.create(
  title: Faker::Commerce.department,
  tags: Faker::Commerce.product_name,
  estimated_duration: "3 weeks",
  expert: vitor
)

puts "campaign is created"