# frozen_string_literal: true

SYM_HASH = { wKing: "\u2654", bKing: "\u265A",
             wQueen: "\u2655", bQueen: "\u265B",
             wRook: "\u2656", bRook: "\u265C",
             wBishop: "\u2657", bBishop: "\u265D",
             wKnight: "\u2658", bKnight: "\u265E",
             wPawn: "\u2659", bPawn: "\u265F",
             free: ' ' }.freeze

class Piece
  attr_accessor :type, :color, :symbol, :position, :kills

  def initialize(type, position)
    @type = type
    @name = type.to_s
    @symbol = SYM_HASH[type]
    @position = position
    @kills = 0
    @color = if @name.start_with?('b')
               :black
             else
               :white
             end
  end
end

class King < Piece
  legal_moves = ''
  def move
  end
end

class Queen < Piece
  legal_moves = ''
  def move
  end
end
class Bishop < Piece
  legal_moves = ''
  def move
  end
end
class Knight < Piece
  legal_moves = ''
  def move
  end
end
class Rook < Piece
  legal_moves = ''
  def move
  end
end
class Pawn < Piece
  legal_moves = ''
  def move
  end
end
