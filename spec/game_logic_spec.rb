#spec/main_spec.rb
require_relative '../lib/game_logic.rb'

describe Board do
  describe "#display" do
    it "print the board" do
      empty_board = "_ _ _\n_ _ _\n_ _ _\n\n"
      expect do
        Board.new.display
      end.to output(empty_board).to_stdout
    end
    it 'does not print the board' do
      empty_board = "_ _\n_ _\n_ _\n\n"
      expect do
        Board.new.display
      end.to_not output(empty_board).to_stdout
    end
  end

  describe "#update" do
    it "Should update the first element with X" do
      expect do
        new_board = Board.new
        new_board.update('1','X')
        expect(new_board.rows[0][0]).to eq('X')
      end
    end
    it "After updating the first element with X, it should not be O" do
      expect do
        new_board = Board.new
        new_board.update('1','X')
        expect(new_board.rows[0][0]).to_not eq('O')
      end
    end
    it "After updating the fourth element with O, it should be O" do
      expect do
        new_board = Board.new
        new_board.update('4','O')
        expect(new_board.rows[0][0]).to eq('O')
      end
    end
  end

  describe "#valid_cell?" do

    it "A random cell should be empty after initializing the board" do
      expect do
        new_board = Board.new
        expect(new_board.rows[2][2]).to eq('_')
      end
    end
    it "After updating the board, the cell should not be empty" do
      expect do
        new_board = Board.new
        new_board.update('5','O')
        expect(new_board.rows[1][1]).to_not eq('_')
      end
    end
  end

end
