# frozen_string_literal: true

class Square
  attr_accessor :coordinates, :moves

  def initialize(x, y)
    @coordinates = [x, y]
    @moves = nil
  end
end
