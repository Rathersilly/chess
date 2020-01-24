move = :e4  # => :e4
case move   # => :e4
when /([a-g])(\d)/ # move pawn
  puts $0   # => nil
  puts $1   # => nil
  puts $2   # => nil
end         # => nil
move =~/([a-g])(\d)/ # move pawn
  puts $0   # => nil
  puts $1   # => nil
  puts $2   # => nil

# >> /tmp/seeing_is_believing_temp_dir20200124-29270-ff6o0c/program.rb
# >> e
# >> 4
# >> /tmp/seeing_is_believing_temp_dir20200124-29270-ff6o0c/program.rb
# >> e
# >> 4
