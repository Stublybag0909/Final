# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# Create a main sample user.
User.create!(name: "Example User", email: "example@taylor.edu")
# Generate a bunch of additional users.
20.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@taylor.edu"
    User.create!(name: name, email: email)
end
#Microposts
users = User.order(:created_at).take(6)
20.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content)}
end
# Create following relationships.
users = User.all
user = users.first
following= users[4..20]
followers = users[5..15]
following.each { |followed| user.following}
followers.each { |follower| follower.followers}
