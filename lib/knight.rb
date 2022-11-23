# frozen_string_literal: true

class Knight
  def initialize(position = nil)
    @position = position
  end

  def self.get_available_moves(x, y)
  moves = []
  moves.push(
    [x + 2, y + 1],
    [x + 2, y - 1],
    [x + 1, y + 2],
    [x + 1, y - 2],
    [x - 2, y + 1],
    [x - 2, y - 1], 
    [x - 1, y + 2], 
    [x - 1, y - 2]
    )

  available_moves = moves.select do |move|
      move[0].between?(0,7) && move[1].between?(0,7)
    end
  end
end