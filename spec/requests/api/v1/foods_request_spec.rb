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
      expect(status).to eq("Created Hot Dog")
      expect(Food.count).to eq(1)
    end
  end

end
