require 'rails_helper'

RSpec.describe ReactionEntry, type: :model do
  describe 'Validations' do
    it { should validate_numericality_of(:time) }
  end

  describe 'Relationships' do
    it { should belong_to :reaction }
  end
end
