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
  attr_accessor :board, :p_white, :p_black, :test_turns, :game
  def initialize
    # player_setup
    @test_turns = 3
    @board = Board.new
    @board.draw
    menu
  end

  def menu
    # option to start new game
    puts "IN MENU"
    # option to load PGN
    #puts 'Please enter filename to load: '
    # filename = gets.chomp
    filename = 'PGN_Sample.txt'
    @game = Game.new(filename)
    @p_white = @game.p_white
    @p_black = @game.p_black
    game_loop
    puts "------------------GAME OVER----------------".light_red
  end

  def player_setup
    @p_white = Player.new('White')
    @p_black = Player.new('Black')
  end

  def game_loop
    turn = 1
    # @game.moves is an array of 2-size arrays representing each move
    @test_turns.times do
      print "TURN #{turn}: ".light_blue
      current_move = @game.moves[turn - 1][0]
      take_turn(@game.p_white, current_move)

      current_move = @game.moves[turn - 1][1]
      take_turn(@game.p_black, current_move)
      turn += 1
    end
  end

  def take_turn(player, move)
    print "#{player}'s turn. -> ".light_blue
    # print 'Enter move: '

    # move = gets
    # check legal move? move proper piece, update @board.grid, draw board
    # something if legal?(move)
    move_piece(player, move)
  end

  def move_piece(player, move)
    # puts @board.inspect.green
    puts move.to_s.light_blue
    print "IN MOVE_PIECE #{player}: "

    move = move.to_sym
    case move
    when /^([a-g])(\d)/ # move pawn
      puts "PAWN"
      file = Regexp.last_match(1)
      rank = Regexp.last_match(2)
      new_square = nil
      if player == @p_white
        puts "sup"
        (1..rank.to_i).reverse_each do |i|
          new_square = (file + i.to_s).to_sym
          next unless board.grid[new_square].type == :wPawn

          board.grid[move], board.grid[new_square] = board.grid[new_square], board.grid[move]
          puts "moving #{new_square} to #{move}".yellow
          break
        end
        @board.draw
      end
      if player == @p_black
        (rank.to_i..8).each do |i|
          new_square = (file + i.to_s).to_sym
          next unless board.grid[new_square].type == :bPawn

          board.grid[move], board.grid[new_square] = board.grid[new_square], board.grid[move]
          puts "moving #{new_square} to #{move}".yellow
          break
        end
        @board.draw
      end

      # if black

      # check column for pieces of same color, check if they have this as a legal move
      # $1
    when /([a-g])x([a-g]\d)/ # pawn captures
      # $1, $2
    when /(B\d?)([a-g]\d)/ # Bishop moves
      puts "BISHOP"
      file = Regexp.last_match(1)
      rank = Regexp.last_match(2)
    when /(N\d?)([a-g]\d)/ # Knight moves
      puts "KNIGHT"
      file = Regexp.last_match(1)
      rank = Regexp.last_match(2)
      #possible squares: up/down = 1/2 or 2/1
      
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
