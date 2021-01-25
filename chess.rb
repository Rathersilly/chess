#!/usr/bin/env ruby
# frozen_string_literal: true

# make container for all the board states of game
# or possibly include it in a game class which contains
# list of moves, players, date, etc

require './board'
require './piece'
require './player'
require './game'
require 'colorize'
require './move'

class Chess
  attr_accessor :board, :p_white, :p_black, :test_turns, :game

  def initialize
    # player_setup
    @test_turns = 5
    @board = Board.new
    @board.draw
    menu
  end

  def menu
    # option to start new game
    # puts 'IN MENU'
    # option to load PGN
    # puts 'Please enter filename to load: '
    # filename = gets.chomp
    filename = 'PGN_Sample.txt'
    @game = Game.new(filename)
    @p_white = @game.p_white
    @p_black = @game.p_black
    game_loop
    # p @board
    puts '------------------GAME OVER----------------'.light_red
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

      print "TURN #{turn}: ".light_blue
      current_move = @game.moves[turn - 1][1]
      take_turn(@game.p_black, current_move)
      turn += 1
    end
  end

  def take_turn(player, move = nil)
    # if move=nil (the default) means player actually plays - not from pgn
    # print "#{player}'s turn. -> ".light_blue
    # print 'Enter move: '

    # move = gets
    # check legal move? move proper piece, update @board.grid, draw board
    #
    # something if legal?(move)
    # print "\e[5;1H"
    print "Current Move: #{player}, #{move}  "
    move_piece(player, move)
  end

  def move_piece(player, move)
    # puts @board.inspect.green
    puts move.to_s.light_blue
    # print "IN MOVE_PIECE: #{player}: "

    move = move.to_sym
    mbits = move.match(/^([A-Z]?)([a-z0-9]?)(x?)([a-g]\d)/)
    piece = mbits[1]
    specifier = mbits[2]
    captures = mbits[3]
    square = mbits[4]
    file = square[0]
    rank = square[1]
    old_square = nil
    case piece
    when '' # move pawn
      square = square.to_sym
      # find old square, empty it, fill new square, capture if necessary
      # check ranks 1 then 2 less than new_square for a pawn
      if player == @p_white
        (1..2).each do |i|
          old_rank = (rank.ord - i).chr
          old_square = (file + old_rank).to_sym
          break if board[old_square].type == :wPawn
        end
      elsif player == @p_black
        (1..2).each do |i|
          old_rank = (rank.ord + i).chr
          old_square = (file + old_rank).to_sym
          break if board[old_square].type == :bPawn
        end
      end
      puts "moving #{old_square} to #{square}".yellow
      temp = board[square]
      board[square] = board[old_square]
      board[old_square] = temp

    when /([a-g])x([a-g]\d)/ # pawn captures
    when 'B' # Bishop moves
      puts 'BISHOP'
      # iterate through possible squares
      # check ++, +-, -+,--

      # +-
      bishops = []
      test_square = nil

      (1..8).each do |i|
        test_square = (file.ord + i).chr + (rank.ord - i).chr
        p test_square
        break unless test_square[0] =~ /[a-g]/ && test_square[1] =~ /[1-8]/

        if board[test_square].type == :wBishop
          bishops << test_square
        elsif board[test_square].type == :free
          next
        else
          break
        end
        #next unless board[test_square].type == :wBishop
      end
        old_square = test_square
      # bishops = []
      old_square = bishops[0]
      puts "moving #{old_square} to #{square}".yellow
      temp = board[square]
      board[square] = board[old_square]
      board[old_square] = temp

    when /(N\d?)([a-g]\d)/ # Knight moves
      puts 'KNIGHT'
      file = Regexp.last_match(1)
      rank = Regexp.last_match(2)
      # possible squares: up/down = 1/2 or 2/1

    when /(R\d?)([a-g]\d)/ # Rook moves
    when /(Q\d?)([a-g]\d)/ # Queen moves
    when /(K\d?)([a-g]\d)/ # King moves

    when /O-O/ # kingside castles
    when /O-O-O/ # queenside castles
    end

    @board.draw
  end

  def legal?(move); end
end
Chess.new
