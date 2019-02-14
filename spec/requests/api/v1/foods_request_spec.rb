require 'rails_helper'

RSpec.describe '/api/v1/foods' do

  let(:endpoint) { '/api/v1/foods' }
  let(:headers)  {{ 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }}

  describe 'GET' do
    it 'returns all food records' do
      Food.create(name: "hot dog")
      Food.create(name: "coffee")

      get endpoint

      data = JSON.parse(response.body)["data"]
      expect(data.length).to eq(2)
    end

  end


  describe 'POST' do
    it 'creates a food record' do
      post "#{endpoint}?name=Hot Dog"

      expect(response.status).to eq(201)

      status = JSON.parse(response.body)['status']
      id = JSON.parse(response.body)['id']

      expect(status).to eq("Created Hot Dog")
      expect(Food.count).to eq(1)
      expect(Food.last.id).to eq(id)
    end

    it 'wont create a food if the body is empty' do
      post endpoint

      expect(response.status).to eq(400)

      status = JSON.parse(response.body)['status']

      expect(status).to eq("params are empty")
      expect(Food.count).to eq(0)
    end

    it 'wont create a duplicate food' do
      food = Food.create(name: "Hot Dog")
      name = "Hot dog"
      hot_dog_id = Food.find_by(name: "Hot Dog").id
      post "#{endpoint}?name=#{name}"

      expect(response.status).to eq(400)

      status = JSON.parse(response.body)['status']
      id = JSON.parse(response.body)['id']

      expect(status).to eq("#{name} is a duplicate")
      expect(id).to eq(hot_dog_id)
      expect(Food.count).to eq(1)
    end
  end

end
