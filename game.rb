# frozen_string_literal: true
require 'colorize'

# TODO get pgn comments
class Game
  attr_accessor :site, :date, :round, :p_white, :p_black, :result, :moves

  def initialize(*args)
    import_game(args[0]) if args.size == 1

  end

  def get_pgn_data
    @site = @pgn.match(/Site "(.*)?"/)[1]
    @date = @pgn.match(/Date "(.*)?"/)[1]
    @round = @pgn.match(/Round "(.*)?"/)[1]
    @p_white = @pgn.match(/White "(.*)?"/)[1]
    @p_black = @pgn.match(/Black "(.*)?"/)[1]
    @result = @pgn.match(/Result "(.*)?"/)[1]
    @moves = @pgn.scan(/\d\.\s+(\w+)\s+([-\w]+)/)
  end

  def import_game(filename = 'PGN_Sample.txt')
    File.open(filename) do |f|
      @pgn = f.read
    end
    get_pgn_data
  end

end

g = Game.new('PGN_Sample.txt')
puts g.inspect.green
puts g.moves.to_s.blue
