
describe Board do
  context 'each method can find squares with certain pieces' do
    it 'returns squares that contain pawns' do
      b = Board.new
      b.each do |square|
        puts square, grid[square]
      end



    end
  end
end


