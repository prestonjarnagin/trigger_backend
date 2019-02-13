require 'rails_helper'
require 'pry'

RSpec.describe '/api/v1/food_entries' do

  let(:endpoint) { '/api/v1/food_entries' }
  let(:headers)  {{ 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }}

  describe 'GET' do
    xit 'returns all food entry records' do
      food_1 = Food.create(name: "hot dog")
      food_2 = Food.create(name: "coffee")
      food_entry_1 = food_1.food_entries.create(created_at: 1_000_000)
      food_entry_2 = food_1.food_entries.create(created_at: 1_086_400)
      food_entry_3 = food_2.food_entries.create(created_at: 1_086_400)

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
  end

end
