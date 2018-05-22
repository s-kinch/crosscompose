class CreateLetters < ActiveRecord::Migration[5.1]
  def change
    create_table :letters do |t|
      t.integer :puzzle_id
      t.integer :x
      t.integer :y
      t.boolean :black
      t.string :value
      t.integer :across_clue_id, default: 1
      t.integer :down_clue_id, default: 2
    end
  end
end
