require 'rails_helper'

RSpec.describe '/api/v1/foods' do

  let(:endpoint) { '/api/v1/foods' }
  let(:headers)  {{ 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }}

  describe 'GET' do

  end

  describe 'POST' do
    it 'creates a food record' do
      name = "Hot Dog"
      post "#{endpoint}?name=#{name}"
      expect(response.status).to eq(201)

      status = JSON.parse(response.body)['status']
      expect(status).to eq("Created Hot Dog")
    end
  end

end
