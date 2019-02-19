class AddTimeToReactionEntries < ActiveRecord::Migration[5.1]
  def change
    change_table :reaction_entries do |t|
      t.bigint :time
    end
  end
end
