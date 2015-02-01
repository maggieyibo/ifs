# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  Tag.create(name: Faker::Commerce.department)
end

# 10.times do
#   p = Post.create(title: Faker::Company.bs, body: Faker::Hacker.say_something_smart)
#   3.times do
# 	Post_tag_weight.create(weight: rand(0..100))
#   end
# end