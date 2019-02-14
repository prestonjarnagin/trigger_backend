class Food < ApplicationRecord
  validates_presence_of :name
  validates :name, uniqueness: true
  has_many :food_entries
end
