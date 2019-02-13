class CreateFoodEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :food_entries do |t|
      t.references :food, foreign_key: true

      t.timestamps
    end
  end
end
