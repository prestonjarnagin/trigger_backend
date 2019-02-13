require 'rails_helper'

RSpec.describe '/api/v1/reaction_entries' do

  let(:endpoint) {'/api/v1/reaction_entries'}
  let(:headers)  {{ 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }}

  describe 'GET' do
    it 'returns all reaction entry records' do
      reaction_1 = Reaction.create(name: "Headache")
      reaction_2= Reaction.create(name: "Upset Stomach")
      ReactionEntry.create(reaction_id: reaction_1.id)
      ReactionEntry.create(reaction_id: reaction_2.id)

      get endpoint

      data = JSON.parse(response.body)["data"]
      expect(data.length).to eq(2)
      expect(data[0]).to include('id')
      expect(data[0]).to include('type')
      attributes = data[0]['attributes']
      expect(attributes).to include('reaction_id')
      expect(attributes).to include('created_at')
      # Check for UNIX timestamp format
      expect(attributes['created_at'].to_s.length).to eq(10)
    end
  end
end
