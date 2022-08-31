# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Product.create(
  name: "Vans",
  price: 110,
  image_url: "https://www.vans.com/en-us/customs-c0004/vans-x-stranger-things-customs-poster-art-old-skool-pvn0a3vc1167?recipe=34e5499e55d5127af1004fa52cfa71a0",
  description: "A great shoe for back to school!",
)
Product.create(
  name: "Sperry",
  price: 100,
  image_url: "https://www.sperry.com/en/authentic-original-boat-shoe/10118M.html?dwvar_10118M_color=0197640#cgid=men-shoes-boat-shoes&start=1",
  description: "A great shoe for style!",
)
Product.create(
  name: "UGG ",
  price: 105,
  image_url: "https://www.ugg.com/master-sale/westsider-neumel-weather/1120902.html?dwvar_1120902_color=TSD",
  description: "A great shoe for winter",
)
p "Hello"
