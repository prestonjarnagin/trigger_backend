class ReactionEntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :reaction_id

  attribute :created_at do |object|
    object.created_at.to_i
  end
end
