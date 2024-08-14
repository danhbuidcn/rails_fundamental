# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

10.times do
  BlogPost.create(
    title: Faker::Book.title,
    body: Faker::Lorem.paragraphs(number: 5).join("\n")
  )
end

# Find or initialize the user by email
user = User.find_or_initialize_by(email: 'admin@gmail.com')

# Set the password and password confirmation
user.password = 'password'
user.password_confirmation = 'password'

# Save the user to the database
if user.save
  puts "User created or updated successfully!"
else
  puts "Failed to create or update user: #{user.errors.full_messages.join(', ')}"
end