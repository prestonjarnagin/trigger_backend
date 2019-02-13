class AddTimeToFoodEntries < ActiveRecord::Migration[5.1]
  def change
    change_table :food_entries do |t|
      t.integer :time
    end 
  end
end
