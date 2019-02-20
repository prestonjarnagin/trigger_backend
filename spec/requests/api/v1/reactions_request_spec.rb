require 'rails_helper'

RSpec.describe '/api/v1/reactions' do

  let(:endpoint) { '/api/v1/reactions' }
  let(:headers)  {{ 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }}

  describe 'GET' do
    it 'returns all reaction records' do
      Reaction.create(name: "Headache")
      Reaction.create(name: "Upset Stomach")

      get endpoint

      data = JSON.parse(response.body)["data"]
      expect(data.length).to eq(2)
    end
  end

  describe 'GET /:id' do
    it 'returns a reaction with details' do
      reaction = Reaction.create(name: "Headache")

      now = Time.now.to_i
      food_2 = Food.create(name: "Coffee")
      food_1 = Food.create(name: "Hot Dog")
      food_3 = Food.create(name: "Hamburger")
      food_entry_1 = FoodEntry.create(food_id: food_1.id, time: now)
      food_entry_3  = FoodEntry.create(food_id: food_2.id, time: now)
      reaction_entry_1 = reaction.reaction_entries.create(reaction_id: reaction.id, time: now + 1_000)
      reaction_entry_10 = reaction.reaction_entries.create(reaction_id: reaction.id, time: now - 100_000)

      food_entry_2  = FoodEntry.create(food_id: food_1.id, time: now - 500_000)
      reaction_entry_2 = ReactionEntry.create(reaction_id: reaction.id, time: now - 499_000)

      food_entry_4  = FoodEntry.create(food_id: food_2.id, time: now - 800_000)

      food_entry_5  = FoodEntry.create(food_id: food_2.id, time: now - 99_999_990)
      reaction_entry_3 = ReactionEntry.create(reaction_id: reaction.id, time: now - 99_999_950)

      food_entry_5  = FoodEntry.create(food_id: food_3.id, time: now - 900_000_000)

      get endpoint+"/#{reaction.id}"

      data = JSON.parse(response.body)
      expect(data['name']).to eq('Headache')
      expect(data['foods'][0]['name']).to eq('Hot Dog')
      expect(data['foods'][1]['name']).to eq('Coffee')
      expect(data['foods'][0]['frequency']).to eq(1.0)
      expect(data['foods'][1]['frequency']).to eq(0.67)
      expect(data['occurrences']['last_7_days']).to eq(2)
      expect(data['occurrences']['last_15_days']).to eq(2)
      expect(data['occurrences']['last_30_days']).to eq(2)
      expect(data['occurrences']['last_31_to_60_days']).to eq(0)
    end
  end


  describe 'POST' do
    it 'creates a reaction record' do
      name = "Headache"
      post "#{endpoint}?name=#{name}"
      expect(response.status).to eq(201)

      status = JSON.parse(response.body)['status']
      expect(status).to eq("Created Headache")
      expect(Reaction.count).to eq(1)
    end

    it 'wont create a reaction if the body is empty' do
      post endpoint

      expect(response.status).to eq(400)

      status = JSON.parse(response.body)['status']

      expect(status).to eq("params are empty")
      expect(Reaction.count).to eq(0)
    end

    it 'wont create a duplicate reaction' do
      reaction = Reaction.create(name: "Headache")
      name = "HeAdAcHe"
      headache_id = reaction.id
      post "#{endpoint}?name=#{name}"

      expect(response.status).to eq(409)

      status = JSON.parse(response.body)['status']
      id = JSON.parse(response.body)['id']

      expect(status).to eq("#{name} is a duplicate")
      expect(id).to eq(headache_id)
      expect(Reaction.count).to eq(1)
    end

  end

end
