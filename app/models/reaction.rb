class Reaction < ApplicationRecord
  validates_presence_of :name
  validates :name, uniqueness: true
  has_many :reaction_entries
end
