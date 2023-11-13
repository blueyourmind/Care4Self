# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Frequency.create(name: 'Once per day', description: 'One time per day', value: 1)
Frequency.create(name: 'Twice per day', description: 'Two times per day', value: 2)
Frequency.create(name: 'Thrice per day', description: 'Three times per day', value: 3)

# db/seeds.rb

# Seed intervals
Interval.create(name: 'Daily', value: 1)
Interval.create(name: 'Weekly', value: 7)
Interval.create(name: 'Monthly', value: 30)
