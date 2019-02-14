class ReactionEntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :reaction_id

  attribute :time do |object|
    object.created_at.to_i
  end
end
