class Puzzle < ApplicationRecord
  has_many :clues
  has_many :letters

  def self.new_slug
    TokenPhrase.generate(:numbers => false)
  end

  def self.title_from_slug(slug)
    slug.gsub('-', ' ').titlecase()
  end

  def black_square_coords
    self.letters.select{|l| l['black']}.map{|l| {'x': l['x'], 'y': l['y']}}
  end

end
