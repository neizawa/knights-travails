# frozen_string_literal: true

require 'pry-byebug'

require_relative 'square'

class Board
  attr_accessor :squares

  def initialize
    @squares = []
    generate_squares
    get_moves
  end

  def generate_squares
    (1..8).each do |x|
      (1..8).each do |y|
        @squares << Square.new(x, y)
      end
    end
  end

  def get_moves
    @squares.each do |square|
      potential_moves = get_potential_moves(square)
      valid_moves = get_valid_moves(potential_moves)

      square.moves = @squares.select do |other_square|
        valid_moves.any?(other_square.coordinates)
      end
    end
  end

  def get_potential_moves(square)
    [
      [square.coordinates[0] + 2, square.coordinates[1] + 1],
      [square.coordinates[0] + 2, square.coordinates[1] - 1],
      [square.coordinates[0] + 1, square.coordinates[1] + 2],
      [square.coordinates[0] + 1, square.coordinates[1] - 2],
      [square.coordinates[0] - 2, square.coordinates[1] + 1],
      [square.coordinates[0] - 2, square.coordinates[1] - 1],
      [square.coordinates[0] - 1, square.coordinates[1] + 2],
      [square.coordinates[0] - 1, square.coordinates[1] - 2]
    ]
  end

  def get_valid_moves(moves)
    moves.select do |move|
      move[0].between?(1, 8) &&
        move[1].between?(1, 8)
    end
  end
end
