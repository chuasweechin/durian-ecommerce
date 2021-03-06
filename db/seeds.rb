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

Durian.create(name: "Mao Shan Wang", price_per_kg: 1800, description: "The Mao Shan Wang durian has a creamy and sticky texture where you can have both sweet flesh and bitter flesh inside a single durian. Mao Shan Wang durian has a bright yellow flesh.", cream_id: 3, sweet_id: 4, image_url: "https://i.imgur.com/jKMQZyT.jpg")

Durian.create(name: "D24", price_per_kg: 1200, description: "For people who are hesitant but would like to try, the D24 is a good choice because of its neutral taste that is not too sweet or too bitter. Less overwhelming in flavor, the D24 has a thick and creamy texture with a light bittersweet taste.", cream_id: 5, sweet_id: 3, image_url: "https://i.imgur.com/PRcdmr3.jpg")

Durian.create(name: "D13", price_per_kg: 1000, description: "The D13 durian flesh is sweet, less fibrous, with large seeds and easier to eat. Most importantly, the D13 durian is recommended by bloggers for those first time trying, as the smell is less pungent.", cream_id: 4, sweet_id: 2, image_url: "https://i.imgur.com/3UYCLKQ.jpg")

Durian.create(name: "Jin Feng (Golden Phoenix)", price_per_kg: 1800, description: "The Golden Phoenix durian has a pale and yellowish-white meat and has an outer shell that has the color that can range from pale green to brown. It has a strong pungent smell while the flesh is watery and bittersweet in taste.", cream_id: 4, sweet_id: 4, image_url: "https://i.imgur.com/kNdVCaD.jpg")

Durian.create(name: "XO", price_per_kg: 1000, description: "When indulging in XO durian, individuals can feel a bit drowsy since the XO durian is left to be fermented inside its shell longer. It has a thick, soft, and watery flesh that gives a strong and bitter flavor.", cream_id: 5, sweet_id: 3, image_url: "https://i.imgur.com/ud5qo7g.jpg")

Durian.create(name: "Red Prawn", price_per_kg: 1300, description: "The Red Prawn durian got its name from the tint of the orange-reddish tone of the durian’s meat. While still having the signature bitter taste of a durian, the Red Prawn durian is referred to being the sweetest among other types, giving a sweet aftertaste.", cream_id: 2, sweet_id: 5, image_url: "https://i.imgur.com/upyLrhW.jpg")

Durian.create(name: "Black Pearl", price_per_kg: 1500, description: "The Black Pearl durian has a smooth texture that has little fibers, making it easier to eat. The Black Pearl has a bittersweet taste that is not too overwhelming.", cream_id: 5, sweet_id: 5, image_url: "https://i.imgur.com/zYO8zZ4.png")

Durian.create(name: "Green Bamboo", price_per_kg: 1000, description: "Another sweet durian. This breed is popular for its buttery and fibrous flesh. When you pry it open, you’ll find a pale yellow, slightly greenish flesh and a trademark orange stem in the middle of the core.", cream_id: 5, sweet_id: 5, image_url: "https://i.imgur.com/n03NV3y.jpg")

Durian.create(name: "Black Thorn", price_per_kg: 1800, description: "The flesh of the Black Thorn is bright yellow and creamy and it has a sweet and custardy taste, similar to that of Mao Shan Wang – but not as rich and has a lighter texture. The tips of the thorns tend to be darker too, thus the name.", cream_id: 5, sweet_id: 5, image_url: "https://i.imgur.com/IZHFdjm.jpg")

Durian.create(name: "Black Gold", price_per_kg: 1600, description: "The Black Gold durian is characterized by its distinctive bright yellow flesh with blackish seams that almost makes the flesh look green. The strong and bitter taste of the Black Gold durian is for the seasoned durian eaters who can take both its overpowering scent and taste.", cream_id: 5, sweet_id: 5, image_url: "https://i.imgur.com/eyrm34S.jpg")

p "SEEDED DURIAN DATA"