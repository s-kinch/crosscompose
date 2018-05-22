class Clue < ApplicationRecord
  belongs_to :puzzle

  def letters
    Letter.where("across_clue_id = ? OR down_clue_id = ?", self.id, self.id)
  end

end
