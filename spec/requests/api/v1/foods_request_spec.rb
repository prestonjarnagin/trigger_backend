require 'rails_helper'

RSpec.describe '/api/v1/foods' do

  let(:endpoint) { '/api/v1/foods' }
  let(:headers)  {{ 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }}

  describe 'GET' do

  end

  describe 'POST' do
    it 'creates a food record' do
      params = { token: 0 }
      # post(endpoint, {params: params.to_json}, headers)
    end
  end

end
