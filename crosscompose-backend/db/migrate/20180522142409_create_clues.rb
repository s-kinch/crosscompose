class CreateClues < ActiveRecord::Migration[5.1]
  def change
    create_table :clues do |t|
      t.integer :puzzle_id
      t.boolean :across
      t.integer :number
      t.string :text
    end
  end
end
