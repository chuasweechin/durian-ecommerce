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