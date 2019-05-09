# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cream.destroy_all

Cream.create(name: "1")
Cream.create(name: "2")
Cream.create(name: "3")
Cream.create(name: "4")
Cream.create(name: "5")

p "SEEDED CREAM DATA"

Sweet.destroy_all

Sweet.create(name: "1")
Sweet.create(name: "2")
Sweet.create(name: "3")
Sweet.create(name: "4")
Sweet.create(name: "5")

p "SEEDED SWEET DATA"

Durian.destroy_all

Durian.create(name: "Mao Shan Wang", price_per_kg: 1800, description: "The king of durians. Coconuts are not nuts, they are giant fruits.", cream_id: 3, sweet_id: 4, image_url: "https://i.imgur.com/jKMQZyT.jpg")
Durian.create(name: "D24", price_per_kg: 1200, description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.", cream_id: 5, sweet_id: 3, image_url: "https://i.imgur.com/PRcdmr3.jpg")
Durian.create(name: "D13", price_per_kg: 1000, description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!", cream_id: 4, sweet_id: 2, image_url: "https://i.imgur.com/3UYCLKQ.jpg")
Durian.create(name: "Jin Feng (Golden Phoenix)", price_per_kg: 1800, description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.", cream_id: 4, sweet_id: 4, image_url: "https://i.imgur.com/kNdVCaD.jpg")
Durian.create(name: "XO", price_per_kg: 1000, description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!", cream_id: 5, sweet_id: 3, image_url: "https://i.imgur.com/ud5qo7g.jpg")
Durian.create(name: "Red Prawn", price_per_kg: 1300, description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!", cream_id: 2, sweet_id: 5, image_url: "https://i.imgur.com/upyLrhW.jpg")
Durian.create(name: "Black Pearl", price_per_kg: 1500, description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!", cream_id: 5, sweet_id: 5, image_url: "https://i.imgur.com/zYO8zZ4.png")
Durian.create(name: "Green Bamboo", price_per_kg: 1000, description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!", cream_id: 5, sweet_id: 5, image_url: "https://i.imgur.com/n03NV3y.jpg")
Durian.create(name: "Black Thorn", price_per_kg: 1800, description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!", cream_id: 5, sweet_id: 5, image_url: "https://i.imgur.com/IZHFdjm.jpg")
Durian.create(name: "Black Gold", price_per_kg: 1600, description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!", cream_id: 5, sweet_id: 5, image_url: "https://i.imgur.com/eyrm34S.jpg")

p "SEEDED DURIAN DATA"