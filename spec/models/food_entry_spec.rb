require 'rails_helper'

RSpec.describe FoodEntry, type: :model do
  describe 'Relationships' do
    it {should belong_to :food}
  end
end
