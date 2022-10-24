# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(
  name: "Marcus",
  email: "marcus@test.com",
  password: "password",
  admin: true,

)
Supplier.create(
  name: "Van's Off the Wall",
  email: "vansoffthewall@gmail.com",
  phone_number: "(855) 909-8267",
)
Supplier.create(
  name: "Sperry",
  email: "sperry@gmail.com",
  phone_number: "(800) 247-6575",
)
Supplier.create(
  name: "UGG",
  email: "ugg@gmail.com",
  phone_number: "888-432-8530",
)

Product.create(
  name: "Vans",
  price: 110,
  description: "A great shoe for back to school!",
  supplier_id: 1,
)
Product.create(
  name: "Sperry",
  price: 100,
  description: "A great shoe for style!",
  supplier_id: 2,
)
Product.create(
  name: "UGG ",
  price: 105,
  description: "A great shoe for winter",
  supplier_id: 3,
)

Image.create(
  url: "https://i.pinimg.com/originals/3b/de/f0/3bdef078a91fa6ea3b4743f06b58bf44.jpg",
  product_id: 1,
)
Image.create(
  url: "https://dimg.dillards.com/is/image/DillardsZoom/main/ugg-mens-neumel-classic-chukka-boots/04457670_zi_charcoal.jpg",
  product_id: 2,
)
Image.create(
  url: "https://images.vans.com/is/image/Vans/VN000EE3BLK-HERO?hei=1024&wid=1024&qlt=95",
  product_id: 3,
)
p "Hello"
