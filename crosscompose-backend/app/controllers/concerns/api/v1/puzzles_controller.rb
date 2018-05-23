class Api::V1::PuzzlesController < ApplicationController

  def create
    slug = Puzzle.new_slug

    # make sure new slug is unique so create won't fail
    while Puzzle.find_by(slug: slug) do
      slug = Puzzle.new_slug
    end

    title = Puzzle.title_from_slug(slug)
    puzz = Puzzle.create(title: title, slug: slug)

    across_anti_clue = Clue.create(puzzle: puzz, across: true, number: -1, text: 'across anti-clue')
    down_anti_clue = Clue.create(puzzle: puzz, across: false, number: -1, text: 'down anti-clue')

    render json: puzz
  end

  def save
    # allow updating title
    # string.parameterize (slugify title they pass in)
    # if one already exists with this slug do something to it (add # or word or something)
    # https://makandracards.com/makandra/31961-rails-has-a-built-in-slug-generator

    puzzle = Puzzle.find_by(slug: params[:slug])

    params[:across_clues].each do |clue|
      clue = Clue.create(puzzle: puzzle, across: true, number: clue['word'][0]['number'], text: clue['text'])
    end

    params[:down_clues].each do |clue|
      clue = Clue.create(puzzle: puzzle, across: false, number: clue['word'][0]['number'], text: clue['text'])
    end

    params[:letters].each do |row|
      row.each do |letter|
        across_clue = Clue.where(puzzle_id: puzzle.id).where(number: letter['across_clue_number'])[0]
        down_clue = Clue.where(puzzle_id: puzzle.id).where(number: letter['down_clue_number'])[0]
        letter = Letter.create(puzzle: puzzle, x: letter['x'], y: letter['y'], black: letter['black'], value: letter['value'], across_clue: across_clue, down_clue: down_clue)
      end
    end

  end

  def index
    puzzles = Puzzle.all
    render json: puzzles
  end

  def play
    puzzle = Puzzle.find_by(slug: params[:slug])
    render json: puzzle
  end

end
