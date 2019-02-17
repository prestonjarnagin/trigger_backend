class Reaction < ApplicationRecord

  before_validation do |reaction|
    reaction.name = reaction.name.downcase.titleize if attribute_present? 'name'
  end

  validates_presence_of :name
  validates :name, uniqueness: true
  has_many :reaction_entries



  def occurances
    {
      last_7_days: get_occurances_for_range(now - (seconds_in_a_day*7)..now),
      last_15_days: get_occurances_for_range(now - (seconds_in_a_day*15)..now),
      last_30_days: get_occurances_for_range(now - (seconds_in_a_day*30)..now),
      last_31_to_60_days:
        get_occurances_for_range(now - (seconds_in_a_day*60) .. (now - (seconds_in_a_day*30)))
    }
  end

  private

  def get_occurances_for_range(date_range)
      ReactionEntry
      .where(time: date_range)
      .where(reaction_id: self.id)
      .count
  end

  def now
    Time.now.to_i
  end

  def seconds_in_a_day
    86_400
  end

end
