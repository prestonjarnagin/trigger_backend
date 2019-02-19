require 'rails_helper'
require 'pry'

RSpec.describe '/api/v1/food_entries' do

  let(:endpoint) { '/api/v1/food_entries' }
  let(:headers)  {{ 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }}

  describe 'GET' do
    it 'returns all food entry records' do
      food_1 = Food.create(name: "hot dog")
      food_2 = Food.create(name: "coffee")
      food_entry_1 = food_1.food_entries.create(time: 1_000_000)
      food_entry_2 = food_1.food_entries.create(time: 1_086_400)
      food_entry_3 = food_2.food_entries.create(time: 1_086_400)

      get endpoint

      data = JSON.parse(response.body)["data"]

      expect(data.length).to eq(3)
    end

  end


  describe 'POST' do
    it 'creates a food entry record' do
      food = Food.create(name: "Hot Dog")
      id = food.id
      time = 3600
      post "#{endpoint}?food_id=#{id}&time=#{time}"
      expect(response.status).to eq(201)

      status = JSON.parse(response.body)["status"]

      expect(status).to eq("Created Hot Dog entry at 3600")
      expect(FoodEntry.count).to eq(1)
    end

    it 'rejects a food entry record with non integer time' do
      food = Food.create(name: "Hot Dog")
      id = food.id
      time = "123abc"
      post "#{endpoint}?food_id=#{id}&time=#{time}"

      expect(response.status).to eq(400)
      expect(ReactionEntry.count).to eq(0)
    end
  end

  describe 'PATCH' do
    it 'updates a food entry record' do
      food_1 = Food.create(name: "Hot Dog")
      time = 3600
      new_time = 7200
      food_entry = food_1.food_entries.create(time: time, food_id: food_1.id)
      patch "#{endpoint}/#{food_entry.id}?time=#{new_time}"
      expect(response.status).to eq(201)

      status = JSON.parse(response.body)["status"]

      expect(status).to eq("Updated food entry #{food_entry.id} time to 7200")
      expect(FoodEntry.count).to eq(1)
      expect(FoodEntry.find(food_entry.id).time).to eq(7200)
    end
  end

  describe 'DELETE' do
    it 'deletes a food entry record' do
      food = Food.create(name: "Hot Dog")
      food_entry = FoodEntry.create(food_id: food.id, time: 3600)
      delete "#{endpoint}/#{food_entry.id}"

      expect(FoodEntry.count).to eq(0)
      expect(response).to have_http_status(204)
    end
  end

end
