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
require "open-uri"

file_path = Rails.root.join("data", "brick_categories.json")

brick_categories_data = JSON.parse(File.read(file_path))

puts "Cleaning the database..."
BrickCategory.destroy_all
User.destroy_all
Brick.destroy_all
User.create!(email: "colerner@me.com", password: "123456", username: "Conny")
User.create!(email: "1@me.com", password: "123456", username: "Johnny")
User.create!(email: "12@me.com", password: "123456", username: "SanBan")

BRICKS = [
  {
    name: "Red 1x1 Standard Brick",
    user: User.all.sample,
    description: "Classic red LEGO brick",
    address: "123 Brick Street",
    price: 1,
    brick_condition: 4,
    colour: "Red",
    category: "Bricks",
    sub_category: "Basic Bricks",
    size: "1x1",
    category_type: "Standard",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461959/bm8rlovxuc4tb1yyprtd.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Blue 2x4 Reinforced Brick",
    user: User.all.sample,
    description: "Strong blue brick with reinforcement",
    address: "456 Brick Avenue",
    price: 2,
    brick_condition: 3,
    colour: "Blue",
    category: "Bricks",
    sub_category: "Basic Bricks",
    size: "2x4",
    category_type: "Reinforced",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461949/k4ixoaj9xfrjhtmn2jdk.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Green 1x2 Standard Plate",
    user: User.all.sample,
    description: "Standard green LEGO plate",
    address: "789 Plate Road",
    price: 1,
    brick_condition: 5,
    colour: "Green",
    category: "Plates",
    sub_category: "Basic Plates",
    size: "1x2",
    category_type: "Standard",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461967/to8rhtl1ropvv8adfnwy.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Yellow 2x2 Plates with Clips",
    user: User.all.sample,
    description: "Yellow plates with clips for attachments",
    address: "101 Clip Avenue",
    price: 2,
    brick_condition: 2,
    colour: "Yellow",
    category: "Plates",
    sub_category: "Modified Plates",
    size: "2x2",
    category_type: "Plates with clips",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461967/to8rhtl1ropvv8adfnwy.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Blue 1x4 Smooth Tile",
    user: User.all.sample,
    description: "Smooth white LEGO tile for finishing",
    address: "234 Tile Street",
    price: 1,
    brick_condition: 4,
    colour: "Blue",
    category: "Tiles",
    sub_category: "Smooth Tiles",
    size: "1x4",
    category_type: "Standard",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461967/to8rhtl1ropvv8adfnwy.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Orange Slope 30° 1x1x2/3",
    user: User.all.sample,
    description: "Black 30-degree slope brick",
    address: "567 Slope Road",
    price: 2,
    brick_condition: 3,
    colour: "Orange",
    category: "Slopes",
    sub_category: "Regular Slopes",
    size: "Slope 30° 1x1x2/3",
    category_type: "Standard",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461943/popvaqmbejbi0kv8mqgx.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Grey 1x1 Window Frame",
    user: User.all.sample,
    description: "Clear window frame for LEGO buildings",
    address: "890 Window Avenue",
    price: 3,
    brick_condition: 5,
    colour: "Grey",
    category: "Specialty Parts",
    sub_category: "Windows and Doors",
    size: "default",
    category_type: "Window frames",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461939/yedle4a6h6uhuiloaind.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Yellow 4x4 Heavy-duty Wheel",
    user: User.all.sample,
    description: "Yellow heavy-duty LEGO wheel",
    address: "123 Wheel Street",
    price: 4,
    brick_condition: 1,
    colour: "Yellow",
    category: "Specialty Parts",
    sub_category: "Wheels and Tires",
    size: "Various diameters ranging from small (e.g., car wheels) to large (e.g., truck wheels)",
    category_type: "Heavy-duty wheels",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461967/to8rhtl1ropvv8adfnwy.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Green 2x6 Decorative Element with Patterns",
    user: User.all.sample,
    description: "Green LEGO brick with decorative patterns",
    address: "456 Decor Avenue",
    price: 2,
    brick_condition: 4,
    colour: "Green",
    category: "Bricks",
    sub_category: "Decorative Elements",
    size: "default",
    category_type: "Bricks with patterns",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461967/to8rhtl1ropvv8adfnwy.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Red 2x2 Thin Plate",
    user: User.all.sample,
    description: "Red thin LEGO plate",
    address: "789 Thin Road",
    price: 1,
    brick_condition: 5,
    colour: "Red",
    category: "Plates",
    sub_category: "Basic Plates",
    size: "2x2",
    category_type: "Thin",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461920/waraeg7r5vlkpuchxkdp.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Blue 1x3 Slope 25° 1x3",
    user: User.all.sample,
    description: "Blue 25-degree slope brick",
    address: "101 Slope Avenue",
    price: 2,
    brick_condition: 3,
    colour: "Blue",
    category: "Slopes",
    sub_category: "Regular Slopes",
    size: "Slope 25° 1x3",
    category_type: "Standard",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461925/ghcz8oy5mpr7i1pxvig2.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Grey 1x1 Standard Tile",
    user: User.all.sample,
    description: "Standard white LEGO tile",
    address: "234 Tile Street",
    price: 1,
    brick_condition: 4,
    colour: "Grey",
    category: "Tiles",
    sub_category: "Smooth Tiles",
    size: "1x1",
    category_type: "Standard",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461967/to8rhtl1ropvv8adfnwy.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Green 4x6 Thin Plate",
    user: User.all.sample,
    description: "Green thin LEGO plate",
    address: "567 Thin Road",
    price: 2,
    brick_condition: 2,
    colour: "Green",
    category: "Plates",
    sub_category: "Basic Plates",
    size: "4x6",
    category_type: "Thin",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461896/zburg5qhocxwlqape5l7.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Yellow 2x2 Plates with Angled Edges",
    user: User.all.sample,
    description: "Yellow plates with angled edges",
    address: "890 Angled Avenue",
    price: 3,
    brick_condition: 5,
    colour: "Yellow",
    category: "Plates",
    sub_category: "Modified Plates",
    size: "2x2",
    category_type: "Plates with angled edges",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461889/q2rbaghnggzz8d4mnhrc.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Red 2x4 Standard Brick with Studs on Sides",
    user: User.all.sample,
    description: "Red brick with studs on sides",
    address: "123 Brick Street",
    price: 2,
    brick_condition: 3,
    colour: "Red",
    category: "Bricks",
    sub_category: "Modified Bricks",
    size: "2x4",
    category_type: "Bricks with studs on sides",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461874/sxgc5spovedye7arazud.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Blue 2x2 Standard Plate",
    user: User.all.sample,
    description: "Blue standard LEGO plate",
    address: "456 Plate Avenue",
    price: 1,
    brick_condition: 4,
    colour: "Blue",
    category: "Plates",
    sub_category: "Basic Plates",
    size: "2x2",
    category_type: "Standard",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461932/f3bk08ogalmzcowf7jgf.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Green 1x1 Standard Tile",
    user: User.all.sample,
    description: "Green standard LEGO tile",
    address: "789 Tile Road",
    price: 1,
    brick_condition: 5,
    colour: "Green",
    category: "Tiles",
    sub_category: "Smooth Tiles",
    size: "1x1",
    category_type: "Standard",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461868/kz4w1gvekvopobzepady.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Yellow 2x4 Plates with Clips",
    user: User.all.sample,
    description: "Yellow plates with clips for attachments",
    address: "101 Clip Avenue",
    price: 2,
    brick_condition: 2,
    colour: "Yellow",
    category: "Plates",
    sub_category: "Modified Plates",
    size: "2x4",
    category_type: "Plates with clips",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461963/mvvz2oiwwwjkrtqmkscs.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Orange 2x2 Standard Plate",
    user: User.all.sample,
    description: "White standard LEGO plate",
    address: "234 Plate Street",
    price: 1,
    brick_condition: 4,
    colour: "Orange",
    category: "Plates",
    sub_category: "Basic Plates",
    size: "2x2",
    category_type: "Standard",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461843/u4kkrj6icfautoejddvy.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Grey 1x2 Decorative Element with Grooves",
    user: User.all.sample,
    description: "Black brick with grooves",
    address: "567 Groove Avenue",
    price: 2,
    brick_condition: 3,
    colour: "Grey",
    category: "Bricks",
    sub_category: "Decorative Elements",
    size: "1x2",
    category_type: "Bricks with grooves",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461861/d9eqtkhwoi6jyexqtlth.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Blue 2x2 Window Frame",
    user: User.all.sample,
    description: "Clear window frame for LEGO buildings",
    address: "890 Window Avenue",
    price: 3,
    brick_condition: 5,
    colour: "Blue",
    category: "Specialty Parts",
    sub_category: "Windows and Doors",
    size: "default",
    category_type: "Window frames",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461855/sbryiivqm3e8ezhgizru.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Yellow 6x6 Standard Baseplate",
    user: User.all.sample,
    description: "Yellow standard baseplate for building",
    address: "123 Baseplate Street",
    price: 4,
    brick_condition: 1,
    colour: "Yellow",
    category: "Plates",
    sub_category: "Baseplates",
    size: "16x16",
    category_type: "Standard baseplates",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461904/ztmuekolnj6xadw7csfs.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Green 1x1 Standard Tile with Letters",
    user: User.all.sample,
    description: "Green tile with letters for decoration",
    address: "456 Tile Avenue",
    price: 1,
    brick_condition: 4,
    colour: "Green",
    category: "Tiles",
    sub_category: "Printed Tiles",
    size: "1x1",
    category_type: "Tiles with letters",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461910/vkwyi3lazjx4hldmlkga.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Blue Slope 45° 2x1",
    user: User.all.sample,
    description: "Blue 45-degree slope brick",
    address: "789 Slope Road",
    price: 2,
    brick_condition: 3,
    colour: "Blue",
    category: "Slopes",
    sub_category: "Regular Slopes",
    size: "Slope 45° 2x1",
    category_type: "Standard",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461967/to8rhtl1ropvv8adfnwy.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Grey 1x4 Standard Tile",
    user: User.all.sample,
    description: "White standard LEGO tile",
    address: "101 Tile Avenue",
    price: 1,
    brick_condition: 5,
    colour: "Grey",
    category: "Tiles",
    sub_category: "Smooth Tiles",
    size: "1x4",
    category_type: "Standard",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461954/g1rplicebcedqiw7jnhh.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Grey 2x2 Thin Plate",
    user: User.all.sample,
    description: "Black thin LEGO plate",
    address: "234 Thin Road",
    price: 2,
    brick_condition: 2,
    colour: "Grey",
    category: "Plates",
    sub_category: "Basic Plates",
    size: "2x2",
    category_type: "Thin",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461967/to8rhtl1ropvv8adfnwy.jpg"), filename:"brick.jpg", content_type: "image/png" }
  },
  {
    name: "Grey 2x4 Window Frame",
    user: User.all.sample,
    description: "Clear window frame for LEGO buildings",
    address: "567 Window Avenue",
    price: 3,
    brick_condition: 4,
    colour: "Grey",
    category: "Specialty Parts",
    sub_category: "Windows and Doors",
    size: "default",
    category_type: "Window frames",
    photo: { io: URI.open("https://res.cloudinary.com/dbdzqw6kg/image/upload/v1704461963/mvvz2oiwwwjkrtqmkscs.jpg"), filename:"brick.jpg", content_type: "image/png" }
  }
]

puts "Creating #{brick_categories_data.length} categories..."

brick_categories_data.each do |category_data|
  category_data['subcategories'].each do |sub_category_data|
    sub_category_data['sizes'].each do |size|
      sub_category_data['types'].each do |type|
        BrickCategory.create(category: category_data['category'], sub_category: sub_category_data['name'], size: size, category_type: type)
      end
    end
  end
  puts "created #{category_data['category']}"
end

puts "finished creating #{brick_categories_data.length} brick types"

puts "Creating #{BRICKS.length} bricks"
BRICKS.each do |attributes|
  brick = Brick.create!(attributes)
  puts "Created #{brick.name}"
end

puts "Finished creating #{BRICKS.length} bricks"
