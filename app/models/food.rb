class Food < ApplicationRecord

  before_validation do |food|
    food.name = food.name.downcase.titleize if attribute_present? 'name'
  end

  validates_presence_of :name
  validates :name, uniqueness: true
  has_many :food_entries
end
