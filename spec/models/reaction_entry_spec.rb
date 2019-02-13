require 'rails_helper'

RSpec.describe ReactionEntry, type: :model do
  describe 'Relationships' do
    it {should belong_to :reaction}
  end
end
