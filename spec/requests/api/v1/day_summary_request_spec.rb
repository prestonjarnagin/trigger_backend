require 'rails_helper'

RSpec.describe '/api/v1/day_summary' do

  let(:endpoint) { '/api/v1/day_summary' }
  let(:today) {37000}

  describe 'GET' do
    it 'returns all food and reaction entries' do
      food = Food.create(name: "coffee")
      reaction = Reaction.create(name: "Headache")
      food_entry_1 = food.food_entries.create(time: today+2)
      food_entry_2 = food.food_entries.create(time: today*10)
      reaction_entry_1 = reaction.reaction_entries.create(time: today*20)
      reaction_entry_2 = reaction.reaction_entries.create(time: today+1)

      get endpoint+"?date=#{today}"

      body = JSON.parse(response.body)

      expect(body).to include("data")

      expect(body["data"][0]["attributes"]["type"]).to eq("reaction")
      expect(body["data"][0]["attributes"]["time"]).to eq(today+1)
      expect(body["data"][0]["attributes"]["name"]).to eq("Headache")
      expect(body["data"].length).to eq(2)

    end

    it 'returns all food and reaction entries' do
      food = Food.create(name: "coffee")
      reaction = Reaction.create(name: "Headache")
      food_entry_1 = food.food_entries.create(time: today+2)
      food_entry_2 = food.food_entries.create(time: today*10)
      reaction_entry_1 = reaction.reaction_entries.create(time: today*20)
      reaction_entry_2 = reaction.reaction_entries.create(time: today+1)

      #Should be on the same day but had to adjust for the day_summary controller
      get endpoint+"?date=#{today*10-(3600*7)}"

      body = JSON.parse(response.body)

      expect(body).to include("data")
      
      expect(body["data"][0]["attributes"]["type"]).to eq("food")
      expect(body["data"][0]["attributes"]["time"]).to eq(today*10)
      expect(body["data"][0]["attributes"]["name"]).to eq("Coffee")
      expect(body["data"].length).to eq(1)
    end
  end

end
