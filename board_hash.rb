# frozen_string_literal: true

require 'colorize'
require './piece.rb'

fresh_board = [
  %i[wRook wKnight wBishop wQueen wKing wBishop wKnight wRook],
  Array.new(8) { :wPawn },
  Array.new(8) { :free },
  Array.new(8) { :free },
  Array.new(8) { :free },
  Array.new(8) { :free },
  Array.new(8) { :bPawn },
  %i[bRook bKnight bBishop bQueen bKing bBishop bKnight bRook]
]
FRESH_BOARD_HASH = {}.freeze
(1..8).each_with_index do |num, x|
  ('a'..'h').each_with_index do |let, y|
    pos = (let + num.to_s).to_sym
    FRESH_BOARD_HASH[pos] = Piece.new(fresh_board[x][y], pos)
    # FRESH_BOARD_HASH[pos] = {piece: fresh_board[x][y], pos:$pos_hash[fresh_board[x][y]]}
  end
end
p FRESH_BOARD_HASH

class Board
  def initialize
    @grid = FRESH_BOARD_HASH.dup
    # p @grid
    draw
  end

  def setup_board
  end

  def draw
    count = 0
    (1..8).each do |num|
      ('a'..'h').each do |let|
        pos = (let + num.to_s).to_sym
        if count.even?
          # white background

          print @grid[pos].symbol.to_s.on_light_black
        else
          # dark background
          print @grid[pos].symbol.to_s.on_black
        end
        count += 1
      end
      count += 1
      puts
    end
  end

  def each
    8.times do |row|
      8.times do |col|
        yield grid[row, col]
      end
    end
  end

  def [](pos)
    # take algebraic board position
    # return array  symbol
  end
end

Board.new
