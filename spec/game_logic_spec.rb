# spec/game_logic_spec.rb
require_relative '../lib/game_logic.rb'

describe Board do
  describe '#display' do
    it 'Should print the board' do
      expect do
        Board.new.display
      end.to output("_ _ _\n_ _ _\n_ _ _\n\n").to_stdout
    end

    it 'Should not print the board' do
      expect do
        Board.new.display
      end.to_not output("_ _\n_ _\n_ _\n\n").to_stdout
    end
  end

  describe '#update' do
    it 'Should update the first element with X' do
      new_board = Board.new
      new_board.update('1', 'X')
      expect(new_board.rows[0][0]).to eq('X')
    end

    it 'After updating the first element with X, it should not be O' do
      new_board = Board.new
      new_board.update('1', 'X')
      expect(new_board.rows[0][0]).to_not eql('O')
    end

    it 'After updating the fourth element with O, it should be O' do
      new_board = Board.new
      new_board.update('4', 'O')
      expect(new_board.rows[1][0]).to eql('O')
    end
  end

  describe '#valid_cell?' do
    it 'A random cell should be empty after initializing the board' do
      cell = rand(1..9)
      new_board = Board.new
      expect(new_board.valid_cell?(3)).to eql(true)
    end

    it 'After updating the board, the cell should not be empty' do
      new_board = Board.new
      new_board.update('5', 'O')
      expect(new_board.valid_cell?(5)).to_not eq('_')
    end
  end

  describe '#rows_match?' do
    it 'After updating 3 elements in a row in the board with the same token, it should return true' do
      new_board = Board.new
      new_board.update('1', 'O')
      new_board.update('2', 'O')
      new_board.update('3', 'O')
      expect(new_board.rows_match?).to eql(true)
    end

    it 'After updating 2 rows only in the board with the same token, it should return false' do
      new_board = Board.new
      new_board.update('1', 'O')
      new_board.update('2', 'O')
      new_board.update('5', 'O')
      expect(new_board.rows_match?).to eql(false)
    end
  end

  describe '#columns_match?' do
    it 'After updating 3 elements in a column of the board with the same token, it should return true' do
      new_board = Board.new
      new_board.update('1', 'O')
      new_board.update('4', 'O')
      new_board.update('7', 'O')
      expect(new_board.columns_match?).to eql(true)
    end

    it 'After updating only 2 elements in a column of the board with the same token, it should return false' do
      new_board = Board.new
      new_board.update('1', 'O')
      new_board.update('4', 'O')
      new_board.update('8', 'O')
      expect(new_board.columns_match?).to eql(false)
    end
  end

  describe '#diagonals_match?' do
    it 'After updating 3 elements in a diagonal of the board with the same token, it should return true' do
      new_board = Board.new
      new_board.update('1', 'O')
      new_board.update('5', 'O')
      new_board.update('9', 'O')
      expect(new_board.diagonals_match?).to eql(true)
    end
  end

  describe '#draw?' do
    it 'Should return false at the beginning, when all of the cells are empty' do
      new_board = Board.new
      expect(new_board.draw?).to eql(false)
    end

    it 'Should return true if nobody won and there are no cells available' do
      new_board = Board.new
      new_board.update('1', 'O')
      new_board.update('2', 'X')
      new_board.update('3', 'O')
      new_board.update('4', 'O')
      new_board.update('5', 'X')
      new_board.update('6', 'X')
      new_board.update('7', 'X')
      new_board.update('8', 'O')
      new_board.update('9', 'X')
      expect(new_board.draw?).to eql(true)
    end
  end

  describe '#win?' do
    it 'Should return false at the beginning, when all of the cells are empty' do
      new_board = Board.new
      expect(new_board.win?).to eql(false)
    end

    it 'Should return true if either a row, column or diagonal matches with the same token (X or O)' do
      new_board = Board.new
      new_board.update('1', 'O')
      new_board.update('2', 'O')
      new_board.update('3', 'O')
      expect(new_board.win?).to eql(true)
    end

    it 'Should return false if not all the elements in a row, column or a diagonal match with the same token (X or O)' do
      new_board = Board.new
      new_board.update('1', 'O')
      new_board.update('2', 'X')
      new_board.update('3', 'O')
      expect(new_board.win?).to eql(false)
    end
  end
end

describe Player do
  describe '#initialize' do
    it "The player_movement property should be empty if we don\'t explicitly assign a player movement" do
      new_player = Player.new
      expect(new_player.player_movement).to eql('')
    end

    it 'An instance of player should have a name property equal to the value that we pass it' do
      new_player = Player.new
      new_player.name = 'Mike'
      expect(new_player.name).to eql('Mike')
    end
  end
  describe '#sanitize_choice' do
    it 'Should return true if the argument length is equal to 1 and is a valid number between 1 and 9' do
      new_player = Player.new
      expect(new_player.sanitize_choice('1')).to eql(true)
    end

    it 'Should return false if the argument length is not equal to 1' do
      new_player = Player.new
      expect(new_player.sanitize_choice('ab')).to eql(false)
    end

    it 'Should return false if the argument is not a valid number between 1 and 9' do
      new_player = Player.new
      expect(new_player.sanitize_choice('11')).to eql(false)
    end
  end
end
