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
