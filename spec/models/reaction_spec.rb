require 'rails_helper'

RSpec.describe Reaction, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
  end

  describe 'Relationships' do
    it {should have_many :reaction_entries}
  end

  describe 'Instance Methods' do
      describe '.occurences' do
        it 'returns number of occurences in the last 31_60 days' do
          reaction = Reaction.create(name: "Headache")

          now = Time.now.to_i
          seconds_in_a_day = 86_400
          ReactionEntry.create(reaction_id: reaction.id, time: now)
          ReactionEntry.create(reaction_id: reaction.id, time: now - (seconds_in_a_day * 13))
          ReactionEntry.create(reaction_id: reaction.id, time: now - (seconds_in_a_day * 21))
          ReactionEntry.create(reaction_id: reaction.id, time: (now - (seconds_in_a_day * 25)))
          ReactionEntry.create(reaction_id: reaction.id, time: (now - (seconds_in_a_day * 45)))
          ReactionEntry.create(reaction_id: reaction.id, time: (now - (seconds_in_a_day * 52)))
          ReactionEntry.create(reaction_id: reaction.id, time: (now - (seconds_in_a_day * 80)))

          expected = {
            last_7_days: 1,
            last_15_days: 2,
            last_30_days: 4,
            last_31_to_60_days: 2
          }
          expect(reaction.occurences).to eq(expected)
      end
    end

    describe '.foods' do
      it 'returns an array of food' do
        reaction = Reaction.create(name: "Headache")


        now = Time.now.to_i
        food_1 = Food.create(name: "Hot Dog")
        food_2 = Food.create(name: "Coffee")
        food_3 = Food.create(name: "Hamburger")
        food_entry_1 = FoodEntry.create(food_id: food_1.id, time: now)
        food_entry_3  = FoodEntry.create(food_id: food_2.id, time: now)
        reaction_entry_1 = reaction.reaction_entries.create(reaction_id: reaction.id, time: now + 1_000)

        food_entry_2  = FoodEntry.create(food_id: food_1.id, time: now - 500_000)
        reaction_entry_2 = ReactionEntry.create(reaction_id: reaction.id, time: now - 499_000)

        food_entry_4  = FoodEntry.create(food_id: food_2.id, time: now - 800_000)

        food_entry_5  = FoodEntry.create(food_id: food_2.id, time: now - 99_999_990)
        reaction_entry_3 = ReactionEntry.create(reaction_id: reaction.id, time: now - 99_999_950)

        food_entry_5  = FoodEntry.create(food_id: food_3.id, time: now - 900_000_000)

        expect(reaction.foods).to be_kind_of(Array)
        reaction.foods.each do |food|
          expect(food).respond_to?(:frequency)
          expect(food).respond_to?(:id)
          expect(food).respond_to?(:name)
        end
        expect(reaction.foods[0].frequency).to eq(1.0)
        expect(reaction.foods[0].id).to eq(food_1.id)
        expect(reaction.foods[1].frequency).to eq(0.67)
        expect(reaction.foods[1].id).to eq(food_2.id)
      end
    end
  end
end
