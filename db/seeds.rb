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

#HEADACHE entries
#Jan 13 2019
re_1_1 = ReactionEntry.create(reaction_id: reaction_1.id, time: 1_547_402_894)
#Jan 15 2019
re_1_2 = ReactionEntry.create(reaction_id: reaction_1.id, time: 1_547_532_494)
#Feb 2 2019
re_1_3 = ReactionEntry.create(reaction_id: reaction_1.id, time: 1_549_087_694)
#Feb 3 2019
re_1_4 = ReactionEntry.create(reaction_id: reaction_1.id, time: 1_549_174_094)
#Feb 10 2019
re_1_5 = ReactionEntry.create(reaction_id: reaction_1.id, time: 1_549_778_894)
#Feb 11 2019
re_1_6 = ReactionEntry.create(reaction_id: reaction_1.id, time: 1_549_865_294)
#Feb 17 2019
re_1_5 = ReactionEntry.create(reaction_id: reaction_1.id, time: 1_550_383_694)
#Feb 18 2019
re_1_6 = ReactionEntry.create(reaction_id: reaction_1.id, time: 1_550_470_094)

#STOMACH ACHE entries
#Jan 13 2019
re_2_1 = ReactionEntry.create(reaction_id: reaction_2.id, time: 1_547_402_894)
#Jan 15 2019
re_2_2 = ReactionEntry.create(reaction_id: reaction_2.id, time: 1_547_532_494)
#Feb 2 2019
re_2_3 = ReactionEntry.create(reaction_id: reaction_2.id, time: 1_549_087_694)
#Feb 3 2019
re_2_4 = ReactionEntry.create(reaction_id: reaction_2.id, time: 1_549_174_094)
#Feb 10 2019
re_2_5 = ReactionEntry.create(reaction_id: reaction_2.id, time: 1_549_778_894)
#Feb 11 2019
re_2_6 = ReactionEntry.create(reaction_id: reaction_2.id, time: 1_549_865_294)
#Feb 17 2019
re_2_5 = ReactionEntry.create(reaction_id: reaction_2.id, time: 1_550_383_694)
#Feb 18 2019
re_2_6 = ReactionEntry.create(reaction_id: reaction_2.id, time: 1_550_470_094)
#Jan 12 2019
re_2_7 = ReactionEntry.create(reaction_id: reaction_2.id, time: 1_547_186_894)
#Feb 20 2019
re_2_8 = ReactionEntry.create(reaction_id: reaction_2.id, time: 1_550_642_999)

#Jan 13 2019
fe_5_1 = FoodEntry.create(food_id: food_5.id, time: 1_547_402_000)
#Feb 2 2019
fe_5_2 = FoodEntry.create(food_id: food_5.id, time: 1_549_087_600)
#Feb 18 2018 - note: DONT WANT THIS TO SHOW UP SO WE USE 2018
fe_5_3 = FoodEntry.create(food_id: food_5.id, time: 1_550_470_000)
#Feb 15 2019
fe_5_4 = FoodEntry.create(food_id: food_5.id, time: 1_518_674_894)


#Jan 13 2019
fe_1_1 = FoodEntry.create(food_id: food_1.id, time: 1_547_402_000)
#Feb 2 2019
fe_1_2 = FoodEntry.create(food_id: food_1.id, time: 1_549_087_600)
#Feb 18 2018
fe_1_3 = FoodEntry.create(food_id: food_1.id, time: 1_550_470_000)
#Feb 15 2019
fe_1_4 = FoodEntry.create(food_id: food_1.id, time: 1_518_674_894)
#Feb 17 2019
fe_1_5 = FoodEntry.create(food_id: food_1.id, time: 1_550_383_000)
#Feb 20 2019
fe_1_6 = FoodEntry.create(food_id: food_1.id, time: 1_550_642_894)
