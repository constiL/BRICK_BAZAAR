# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "json"

file_path = Rails.root.join("data", "lego_type.json")

brick_types_data = JSON.parse(File.read(file_path))

puts "Cleaning the brick types database..."
BrickType.destroy_all

puts "Creating #{brick_types_data.length} brick types..."


brick_types_data.each do |brick|
  BrickType.create(
    name: brick['name'],
    category: brick['category'],
    sub_category: brick['subCategory'],
    size: brick['size']
  )
  puts "Created #{brick['name']}"
end

puts "finished creating #{brick_types_data.length} brick types"
