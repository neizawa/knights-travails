# frozen_string_literal: true

class Square
  attr_accessor :coordinates, :moves, :parent

  def initialize(x, y)
    @coordinates = [x, y]
    @moves = nil
    @parent = nil
  end
end
