class FoodEntry < ApplicationRecord
  validates :time, numericality: true
  belongs_to :food
end
