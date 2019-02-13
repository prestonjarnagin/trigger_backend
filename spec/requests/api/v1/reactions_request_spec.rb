require 'rails_helper'

RSpec.describe '/api/v1/reactions' do

  let(:endpoint) { '/api/v1/reactions' }
  let(:headers)  {{ 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }}

  describe 'GET' do
    xit 'returns all reaction records' do
      Food.create(name: "hot dog")
      Food.create(name: "coffee")

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
  end

end
