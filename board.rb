# frozen_string_literal: true

require 'colorize'
require './piece'

fresh_board_array = [
  %i[wRook wKnight wBishop wQueen wKing wBishop wKnight wRook],
  Array.new(8) { :wPawn },
  Array.new(8) { :free },
  Array.new(8) { :free },
  Array.new(8) { :free },
  Array.new(8) { :free },
  Array.new(8) { :bPawn },
  %i[bRook bKnight bBishop bQueen bKing bBishop bKnight bRook]
]
FRESH_BOARD_HASH = Hash.new
(1..8).each_with_index do |num, x|
  ('a'..'h').each_with_index do |let, y|
    pos = (let + num.to_s).to_sym
    FRESH_BOARD_HASH[pos] = Piece.new(fresh_board_array[x][y], pos)
    # FRESH_BOARD_HASH[pos] = {piece: fresh_board[x][y], pos:$pos_hash[fresh_board[x][y]]}
  end
end

class Board
  attr_accessor :grid

  def initialize
    @grid = FRESH_BOARD_HASH.dup
    # p @grid
    # draw
  end

  def setup_board; end

  def [](square)
    @grid[square.to_sym]
  end

  def []=(square, piece)
    @grid[square.to_sym] = piece
  end

  def draw
    gets
    # sleep 1
    system "clear"
    print "\e[10;1H"
    count = 0
    (1..8).reverse_each do |num|
      ('a'..'h').each do |let|
        pos = (let + num.to_s).to_sym
        #puts "position = #{pos}"
        if count.even?
          # light background
          print @grid[pos].symbol.on_light_black
        else
          # dark background
          print @grid[pos].symbol.on_black
        end
        count += 1
      end
      count += 1
      puts
    end
    print "\e[20;1H"
  end

  def each
    (1..8).each do |num|
      ('a'..'h').each do |let|
        pos = (let + num.to_s).to_sym
        yield @grid[pos]
      end
    end
  end

end

if $0 == __FILE__
  b = Board.new
  puts b[:e1]
end
