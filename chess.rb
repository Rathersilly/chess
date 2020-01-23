#!/usr/bin/env ruby
# frozen_string_literal: true

# make container for all the board states of game
# or possibly include it in a game class which contains
# list of moves, players, date, etc

require './board_hash.rb'
require './piece.rb'
require './player.rb'
require './game.rb'
require 'colorize'

class Chess
  def initialize
    # player_setup
    @board = Board.new
    @board.draw
    menu
  end

  def menu
    # option to start new game
    #
    # option to load PGN
    puts 'Please enter filename to load: '
    # filename = gets.chomp
    filename = 'PGN_Sample.txt'
    @game = Game.new(filename)
    game_loop
  end

  def player_setup
    @p_white = Player.new('White')
    @p_black = Player.new('Black')
  end

  def game_loop
    turn = 1
    # @game.moves is an array of 2-size arrays representing each move
    puts turn.to_s.red
    10.times do
      current_move = @game.moves[turn - 1][0]
      take_turn(@game.p_white, current_move)

      current_move = @game.moves[turn - 1][1]
      take_turn(@game.p_black, current_move)
      turn += 1
    end
  end

  def take_turn(player, move)
    print "#{player}'s turn.\n"
    # print 'Enter move: '

    # move = gets
    # check legal move? move proper piece, update @board.grid, draw board
    # something if legal?(move)
    move_piece(player, move)
  end

  def move_piece(player, move)
    #puts @board.inspect.green
    p move
    sleep 0.1
    case move
    when /([a-g])\d/ # move pawn
      # find available squares
      # if white, find piece 1 or 2 squares smaller rank
       
      
      piece = @board.grid.select{|k,v| k.match?($1)}
      # if black
      piece = @board.grid.select{|k,v| k.match?($1)}

      # check column for pieces of same color, check if they have this as a legal move
      # $1
    when /([a-g])x([a-g]\d)/ # pawn captures
      # $1, $2
    when /(B\d?)([a-g]\d)/ # Bishop moves
    when /(N\d?)([a-g]\d)/ # Knight moves
    when /(R\d?)([a-g]\d)/ # Rook moves
    when /(Q\d?)([a-g]\d)/ # Queen moves
    when /(K\d?)([a-g]\d)/ # King moves

    when /O-O/ # kingside castles
    when /O-O-O/ # queenside castles
    end
  end

  def legal?(move)
  end
end
Chess.new
