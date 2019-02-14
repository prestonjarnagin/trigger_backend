class Reaction < ApplicationRecord

  before_validation do |reaction|
    reaction.name = reaction.name.downcase.titleize if attribute_present? 'name'
  end

  validates_presence_of :name
  validates :name, uniqueness: true
  has_many :reaction_entries
end
