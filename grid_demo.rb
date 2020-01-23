8.times do |x|

  8.times do |y|
    print x.to_s+y.to_s + " "

  end
  puts
end

#return grid positions that contain a certain piece
#
def grid_find(symbol)
  
  grid.each do |s|
    if s = :pawn
