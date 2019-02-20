class Reaction < ApplicationRecord

  before_validation do |reaction|
    reaction.name = reaction.name.downcase.titleize if attribute_present? 'name'
  end

  validates_presence_of :name
  validates :name, uniqueness: true
  has_many :reaction_entries

  def foods
    times = self.reaction_entries.pluck(:time)
    ranges = times.map do |time|
      (time-86400)..time
    end
    data = FoodEntry.where(time: [ranges]).pluck(:food_id)
    reaction_counts = Hash.new(0)
    data.each do |food_id|
      reaction_counts[food_id] += 1
    end

    array = []
    results = reaction_counts.map do |food_id, reaction_count|
      frequency = (reaction_count.to_f / FoodEntry.where(food_id: food_id).count).round(2)
      name = Food.find(food_id).name
      ReactionSummary.new(food_id, name, frequency)
    end
  end

  def occurrences
    {
      last_7_days: get_occurrences_for_range(now - (seconds_in_a_day*7)..now),
      last_15_days: get_occurrences_for_range(now - (seconds_in_a_day*15)..now),
      last_30_days: get_occurrences_for_range(now - (seconds_in_a_day*30)..now),
      last_31_to_60_days:
        get_occurrences_for_range(now - (seconds_in_a_day*60) .. (now - (seconds_in_a_day*30)))
    }
  end

  private

  def get_occurrences_for_range(date_range)
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
