#!/usr/bin/env ruby
# frozen_string_literal: true

# make container for all the board states of game
# or possibly include it in a game class which contains
# list of moves, players, date, etc

require './board.rb'
require './piece.rb'
require './player.rb'

class Chess
  def initialization
    player_setup
    @board = Board.new
    @board.draw
  end
  def player_setup
    @p_white = Player.new("White")
    @p_black = Player.new("Black")

  end


  def game_loop
    turn = 1
    10.times do

      take_turn(@p_white)
      take_turn(@p_black)
    end


    


  end
  def take_turn(player)
    print "#{player.name}'s turn.\n"
    print "Enter move: "

    move = gets 
  end
  def check_legal?(move)


  
end

