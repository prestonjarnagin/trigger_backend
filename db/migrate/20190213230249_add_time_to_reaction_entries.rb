class AddTimeToReactionEntries < ActiveRecord::Migration[5.1]
  def change
    change_table :reaction_entries do |t|
      t.integer :time
    end
  end
end
