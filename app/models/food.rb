class Food < ApplicationRecord
  validates_presence_of :name
  has_many :food_entries
end
