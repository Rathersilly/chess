# frozen_string_literal: true

require 'colorize'
require './piece.rb'

$fresh_board = [
  %i[bRook bKnight bBishop bQueen bKing bBishop bKnight bRook],
  Array.new(8) { :bPawn },
  Array.new(8) { :free }, 
  Array.new(8) { :free }, 
  Array.new(8) { :free }, 
  Array.new(8) { :free }, 
  Array.new(8) { :wPawn },
  %i[wRook wKnight wBishop wQueen wKing wBishop wKnight wRook]
]

p $fresh_board

p $sym_hash
class Board
  def initialize
    @grid = $fresh_board.dup
    #p @grid
    draw
  end

  def setup_board

  end
  def draw
    8.times do |row|
      8.times do |col|
        if (row + col) % 2 == 0
          #white background
          print $sym_hash[@grid[7-row][col]].on_light_black
        else
          #dark background
          print $sym_hash[@grid[7-row][col]].on_black
        end

      end
      puts
    end
  end
  def [](pos)
    #take algebraic board position
    #return array  symbol
  end

end

Board.new
