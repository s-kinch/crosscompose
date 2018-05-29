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
    puzzle = Puzzle.find_by(slug: params[:slug])

    new_title = params[:title]
    if puzzle['title'] != new_title
      puzzle['title'] = new_title
      new_slug = new_title.parameterize
      while Puzzle.find_by(slug: new_slug) do
        slug_parts = new_slug.split('-')
        if slug_parts[-1].to_i === 0
          new_slug = slug_parts.join('-') + '-1'
        else
          slug_parts[-1] = slug_parts[-1].to_i + 1
          new_slug = slug_parts.join('-')
        end
      end
      puzzle['slug'] = new_slug
      puzzle.save
    end

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
        new_letter = Letter.create(puzzle: puzzle, x: letter['x'], y: letter['y'], black: letter['black'], value: letter['value'], across_clue: across_clue, down_clue: down_clue)
      end
    end

  end

  def index
    puzzles = Puzzle.all
    render json: puzzles
  end

  def play
    puzzle = Puzzle.find_by(slug: params[:slug])
    render json: puzzle_for_play_start(puzzle)
  end

  def check_letter
    puzzle = Puzzle.find_by(slug: params[:slug])
    letter = Letter.find_by(puzzle: puzzle, x: params[:square][:x], y: params[:square][:y])
    render json: letter
  end

  private
  def puzzle_for_play_start(puzzle)
    {
      slug: puzzle['slug'],
      title: puzzle['title'],
      clues: puzzle.clues.where.not(number: -1),
      black_squares: puzzle.black_square_coords
    }
  end

end
