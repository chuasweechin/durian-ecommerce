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

p "SEEDED CREAM DATA"

Taste.destroy_all

Taste.create(name: "Bitter")
Taste.create(name: "Sweet")

p "SEEDED TASTE DATA"

Durian.destroy_all

Durian.create(name: "Mao Shan Wang", price_per_kg: 1800 )
Durian.create(name: "D24", price_per_kg: 1200 )
Durian.create(name: "D13", price_per_kg: 1000 )
Durian.create(name: "Jin Feng (Golden Phoenix)", price_per_kg: 1800 )
Durian.create(name: "XO", price_per_kg: 1000 )
Durian.create(name: "Red Prawn", price_per_kg: 1300 )
Durian.create(name: "Black Pearl", price_per_kg: 1500 )
Durian.create(name: "Green Bamboo", price_per_kg: 1000 )
Durian.create(name: "Black Thorn", price_per_kg: 1800 )
Durian.create(name: "Black Gold", price_per_kg: 1600 )

p "SEEDED DURIAN DATA"