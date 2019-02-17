require 'rails_helper'

RSpec.describe Reaction, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
  end

  describe 'Relationships' do
    it {should have_many :reaction_entries}
  end

  describe 'Instance Methods' do
      describe '.occurances' do
        it 'returns number of occurances in the last 31_60 days' do
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
          expect(reaction.occurances).to eq(expected)
      end
    end
  end
end
