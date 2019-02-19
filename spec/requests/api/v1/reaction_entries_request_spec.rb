require 'rails_helper'

RSpec.describe '/api/v1/reaction_entries' do

  let(:endpoint) {'/api/v1/reaction_entries'}
  let(:headers)  { { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' } }

  describe 'GET' do
    it 'returns all reaction entry records' do
      reaction_1 = Reaction.create(name: "Headache")
      reaction_2= Reaction.create(name: "Upset Stomach")
      ReactionEntry.create(reaction_id: reaction_1.id, time: 100)
      ReactionEntry.create(reaction_id: reaction_2.id, time: 100)

      get endpoint

      data = JSON.parse(response.body)["data"]
      expect(data.length).to eq(2)
      expect(data[0]).to include('id')
      expect(data[0]).to include('type')
      attributes = data[0]['attributes']
      expect(attributes).to include('reaction_id')
      expect(attributes).to include('time')
    end

  end

  describe 'POST' do
    it 'creates a reaction entry record' do
      reaction = Reaction.create(name: 'Headache')
      timestamp = 1_550_095_808
      entry = {
        time: timestamp,
        reaction_id: reaction.id
      }

      post endpoint, params: entry

      expect(ReactionEntry.count).to eq(1)
      expect(ReactionEntry.first.time).to eq(timestamp)
      status = JSON.parse(response.body)['status']
      expect(status).to include("Entered reaction at #{timestamp}")
    end
  end

  describe 'PATCH' do
    it 'updates an entire reaction entry record' do
      timestamp = 1_550_095_808
      reaction_1 = Reaction.create(name: 'Headache')
      reaction_2 = Reaction.create(name: 'Upset Stomach')
      reaction_entry = ReactionEntry.create(
        reaction_id: reaction_1.id,
        time: timestamp
      )
      timestamp += 30
      request = {
        time: timestamp,
        reaction_id: reaction_2.id
      }

      patch "#{endpoint}/#{reaction_entry.id}", params: request

      expect(ReactionEntry.count).to eq(1)
      expect(ReactionEntry.first.time).to eq(timestamp)
      expect(ReactionEntry.first.reaction_id).to eq(reaction_2.id)
      status = JSON.parse(response.body)['status']
      expect(status).to include("Updated Reaction Entry")
    end

    it 'updates a reaction entry record with just a time' do
      timestamp = 1_550_095_808
      reaction = Reaction.create(name: 'Headache')
      reaction_entry = ReactionEntry.create(
        reaction_id: reaction.id,
        time: timestamp
      )
      timestamp += 30
      request = {
        time: timestamp,
      }

      patch "#{endpoint}/#{reaction_entry.id}", params: request

      expect(ReactionEntry.count).to eq(1)
      expect(ReactionEntry.first.time).to eq(timestamp)
      expect(ReactionEntry.first.reaction_id).to eq(reaction.id)
      status = JSON.parse(response.body)['status']
      expect(status).to include("Updated Reaction Entry")
    end

    it 'updates a reaction entry record with just a food_id' do
      timestamp = 1_550_095_808
      reaction_1 = Reaction.create(name: 'Headache')
      reaction_2 = Reaction.create(name: 'Upset Stomach')
      reaction_entry = ReactionEntry.create(
        reaction_id: reaction_1.id,
        time: timestamp
      )

      request = {
        reaction_id: reaction_2.id
      }
      patch "#{endpoint}/#{reaction_entry.id}", params: request

      expect(ReactionEntry.count).to eq(1)
      expect(ReactionEntry.first.time).to eq(timestamp)
      expect(ReactionEntry.first.reaction_id).to eq(reaction_2.id)
      status = JSON.parse(response.body)['status']
      expect(status).to include("Updated Reaction Entry")
    end
  end

  describe 'DELETE' do
    it 'deletes a reaction entry record' do
      timestamp = 1_550_095_808
      reaction = Reaction.create(name: 'Headache')
      reaction_entry = ReactionEntry.create(
        reaction_id: reaction.id,
        time: timestamp
      )

      delete "#{endpoint}/#{reaction_entry.id}"

      expect(ReactionEntry.count).to eq(0)
      status = JSON.parse(response.body)['status']
      expect(status).to include("Record Deleted")
    end
  end
end
