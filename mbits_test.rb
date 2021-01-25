move = 'e4'
mbits = move.match(/^([A-Z]?)([a-z0-9]?)(x?)([a-g]\d)/)
piece = mbits[1]
specifier = mbits[2]
captures = mbits[3]
square = mbits[4]
file = square[0]
rank = square[1]

puts "piece = #{mbits[1]}"
puts "specifier = #{mbits[2]}"
puts "captures = #{mbits[3]}"
puts "square = #{mbits[4]}"
puts "file = #{square[0]}"
puts "rank = #{square[1]}"
