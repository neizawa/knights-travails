# frozen_string_literal:true

require_relative 'lib/board'
require_relative 'lib/knight'

board = Board.new
board.squares[0].moves.each { |move| p move.coordinates }
