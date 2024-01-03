require "json"

filepath = "data/lego_type.json"

bricks_serialized = File.read(filepath)

bricks = JSON.parse(bricks_serialized)

puts "Cleaning the brick types database..."
BrickType.destroy_all

puts "Creating 348 brick types..."

bricks.each do |brick|
  BrickType.create(
    name: brick['name'],
    category: brick['category'],
    sub_category: brick['subCategory'],
    size: brick['size']
  )
  puts "Created #{brick.name}"
end

puts "finished"
