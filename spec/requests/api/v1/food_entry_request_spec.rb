require 'rails_helper'
require 'pry'

RSpec.describe '/api/v1/food_entries' do

  let(:endpoint) { '/api/v1/food_entries' }
  let(:headers)  {{ 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }}

  describe 'GET' do
    it 'returns all food entry records' do
      Food.create(name: "hot dog")
      Food.create(name: "coffee")
      
      get endpoint

      data = JSON.parse(response.body)["data"]
      expect(data.length).to eq(2)
    end

  end


  describe 'POST' do
    it 'creates a food entry record' do
      food = Food.create(name: "Hot Dog")
      id = food.id
      time = 3600
      post "#{endpoint}?food_id=#{id}&created_at=#{time}"
      expect(response.status).to eq(201)

      status = JSON.parse(response.body)["status"]

      expect(status).to eq("Created Hot Dog entry at 3600")
      expect(FoodEntry.count).to eq(1)
    end
  end

end
