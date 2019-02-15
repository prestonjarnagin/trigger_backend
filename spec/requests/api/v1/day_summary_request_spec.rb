require 'rails_helper'

RSpec.describe '/api/v1/day_summary' do

  let(:endpoint) { '/api/v1/day_summary' }

  describe 'GET' do
    it 'returns all food and reaction entries' do
      food = Food.create(name: "coffee")
      reaction = Reaction.create(name: "Headache")
      food_entry_1 = food.food_entries.create(time: 3602)
      food_entry_2 = food.food_entries.create(time: 2_000_000)
      reaction_entry_1 = reaction.reaction_entries.create(time: 3_000_000)
      reaction_entry_2 = reaction.reaction_entries.create(time: 3601)

      get endpoint+"?date=0"

      body = JSON.parse(response.body)

      expect(body).to include("data")
      
      expect(body["data"][0]["attributes"]["type"]).to eq("reaction")
      expect(body["data"][0]["attributes"]["time"]).to eq(3601)
      expect(body["data"][0]["attributes"]["name"]).to eq("Headache")

    end
  end

end
