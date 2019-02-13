class CreateReactionEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :reaction_entries do |t|
      t.references :reaction, foreign_key: true

      t.timestamps
    end
  end
end
