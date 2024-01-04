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

file_path = Rails.root.join("data", "brick_categories.json")

brick_categories_data = JSON.parse(File.read(file_path))

puts "Cleaning the categories database..."
BrickCategory.destroy_all

puts "Creating #{brick_categories_data.length} categories..."


brick_categories_data.each do |category_data|
  category_data['subcategories'].each do |sub_category_data|
    if sub_category_data['sizes']
      sub_category_data['sizes'].each do |size|
        BrickCategory.create(category: category_data['category'], sub_category: sub_category_data['name'], size: size, category_type: 'Size')
      end
    elsif sub_category_data['types']
      sub_category_data['types'].each do |type|
        BrickCategory.create(category: category_data['category'], sub_category: sub_category_data['name'], size: type, category_type: 'Type')
      end
    end
  end
  puts "created #{category_data['category']}"
end


puts "finished creating #{brick_categories_data.length} brick types"
