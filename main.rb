# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/square'

def knight_moves(starting, ending)
  board = Board.new
  starting_square = board.find(starting)
  ending_square = bfs(starting_square, ending)
  shortest_path = shortest_path(ending_square)

  puts "=> You made it in #{shortest_path.length - 1} moves!  Here's your path:"
  shortest_path.each { |square| print "   #{square}\n" }
end

def bfs(starting, ending)
  queue = [starting]
  passed = []

  until !passed.empty? && passed.last.coordinates == ending
    current = queue.first
    queue.first.moves.each do |move|
      unless passed.include?(move) || queue.include?(move)
        queue.push(move)
        move.parent = current
      end
    end
    passed.push(queue.shift)
  end
  passed.last
end

def shortest_path(square, arr = [square.coordinates])
  return arr if square.parent.nil?

  arr.unshift(square.parent.coordinates)
  shortest_path(square.parent, arr)
end

knight_moves([1, 1], [8, 8])
