# frozen_string_literal: true

require 'colorize'
require './piece.rb'

$fresh_board = [
  %i[bRook bKnight bBishop bQueen bKing bBishop bKnight bRook],
  (Array.new(8) { :bPawn }),
  6.times { Array.new(8) { :free } },
  Array.new(8) { :wPawn },
  %i[wRook wKnight wBishop wQueen wKing wBishop wKnight wRook]
]

p starting_board

class Board
  def initialize
  end

  def setup_board
    grid
  end
end
