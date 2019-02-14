class ReactionEntry < ApplicationRecord
  validates :time, numericality: true
  belongs_to :reaction
end
