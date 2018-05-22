class Letter < ApplicationRecord
  belongs_to :puzzle
  belongs_to :across_clue, class_name: 'Clue'
  belongs_to :down_clue, class_name: 'Clue'


end
