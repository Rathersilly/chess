require './chess.rb'


describe Chess do
  let(:chess) do
    Chess.new
  end
  
  context 'Fischer vs Spassky' do
    it 'can start with e4' do
      #chess.board = Board.new
      #chess.game.moves  = chess.game.moves[0..1]
      #chess.move_piece(@p_white, :e4)
      chess.board.draw
      expect(chess.board[:e4].type).to eq(:wPawn)
    end
    it 'frees e2 with e4 start' do
      chess.board.draw
      #chess.move_piece(@p_white, :e4)
      expect(chess.board[:e2].type).to eq(:free)
    end
    it 'black then moves e5' do
      chess.board.draw
      expect(chess.board.grid[:e2].type).to eq(:free)
    end
  end

end

