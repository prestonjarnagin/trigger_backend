class ReactionEntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :reaction_id

  attribute :time do |object|
    object.time.to_i
  end
end
