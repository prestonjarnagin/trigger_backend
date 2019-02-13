require 'rails_helper'

RSpec.describe Reaction, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
  end

  describe 'Relationships' do
    it {should have_many :reaction_entries}
  end
end
