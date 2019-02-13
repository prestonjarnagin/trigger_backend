class Reaction < ApplicationRecord
  validates_presence_of :name
  has_many :reaction_entries 
end
