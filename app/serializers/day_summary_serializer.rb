class DaySummarySerializer
  include FastJsonapi::ObjectSerializer

  attributes :time

  attribute :type do |object|
    object.class.name[0..-6].downcase
  end

  attribute :name do |object|
    if object.class.name == "ReactionEntry"
      Reaction.find(object.reaction_id).name
    else
      Food.find(object.food_id).name
    end
  end

end
