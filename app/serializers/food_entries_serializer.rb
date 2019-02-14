class FoodEntriesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :food_id, :time
end
