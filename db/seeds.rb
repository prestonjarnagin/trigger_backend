# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

food_1 = Food.create(name: "Hot Dog")
food_2 = Food.create(name: "Coffee")
food_3 = Food.create(name: "Tuna")
food_4 = Food.create(name: "Chocolate")
food_5 = Food.create(name: "Milk")
food_6 = Food.create(name: "Cream")
food_7 = Food.create(name: "Cheese")
food_8 = Food.create(name: "Salmon")
food_9 = Food.create(name: "Ice Cream")
food_10 = Food.create(name: "Bread")
food_11 = Food.create(name: "Hot Sauce")

reaction_1 = Reaction.create(name: "Headache")
reaction_2 = Reaction.create(name: "Stomach Ache")
reaction_3 = Reaction.create(name: "Drowzy")

re_1 = ReactionEntry.create(reaction_id: reaction_1.id, time: 1_547_402_894_000)
