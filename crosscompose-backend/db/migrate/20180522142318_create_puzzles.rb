class CreatePuzzles < ActiveRecord::Migration[5.1]
  def change
    create_table :puzzles do |t|
      t.string :title
      t.string :slug, unique: true
      t.boolean :published, default: false
    end
  end
end
