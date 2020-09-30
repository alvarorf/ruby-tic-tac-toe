#spec/game_logic_spec.rb
require_relative '../lib/game_logic.rb'

describe Board do
  describe "#display" do

    it "print the board" do
      expect do
        Board.new.display
      end.to output("_ _ _\n_ _ _\n_ _ _\n\n").to_stdout
    end

    it 'does not print the board' do
      expect do
        Board.new.display
      end.to_not output("_ _\n_ _\n_ _\n\n").to_stdout
    end
  end

  describe "#update" do

    it "Should update the first element with X" do
      expect do
        let(:new_board) { Board.new}
        new_board.update('1','X')
        expect(new_board.rows[0][0]).to eq('X')
      end
    end

    it "After updating the first element with X, it should not be O" do
      expect do
        let(:new_board) { Board.new}
        new_board.update('1','X')
        expect(new_board.rows[0][0]).to_not eq('O')
      end
    end

    it "After updating the fourth element with O, it should be O" do
      expect do
        let(:new_board) { Board.new}
        new_board.update('4','O')
        expect(new_board.rows[0][0]).to eq('O')
      end
    end
  end

  describe "#valid_cell?" do

    it "A random cell should be empty after initializing the board" do
      expect do
        let(:new_board) { Board.new}
        expect(new_board.rows[2][2]).to eq('_')
      end
    end

    it "After updating the board, the cell should not be empty" do
      expect do
        let(:new_board) { Board.new}
        new_board.update('5','O')
        expect(new_board.rows[1][1]).to_not eq('_')
      end
    end
  end

  describe "#rows_match?" do

    it "After updating 3 elements in a row in the board with the same token, it should return true" do
      expect do
        let(:new_board) { Board.new}
        new_board.update('1','O')
        new_board.update('2','O')
        new_board.update('3','O')
        expect(new_board.rows_match?).be_true
      end
    end

    it "After updating 2 rows only in the board with the same token, it should return false" do
      expect do
        let(:new_board) { Board.new}
        new_board.update('1','O')
        new_board.update('2','O')
        new_board.update('5','O')
        expect(new_board.rows_match?).be_false
      end
    end
  end

  describe "#columns_match?" do
    it "After updating 3 elements in a column of the board with the same token, it should return true" do
      expect do
        let(:new_board) { Board.new}
        new_board.update('1','O')
        new_board.update('4','O')
        new_board.update('7','O')
        expect(new_board.columns_match?).be_true
      end
    end

    it "After updating only 2 elements in a column of the board with the same token, it should return false" do
      expect do
        let(:new_board) { Board.new}
        new_board.update('1','O')
        new_board.update('4','O')
        new_board.update('8','O')
        expect(new_board.columns_match?).be_false
      end
    end
  end

  describe "#diagonals_match?" do

    it "After updating 3 elements in a diagonal of the board with the same token, it should return true" do
    expect do
      let(:new_board) { Board.new}
      new_board.update('1','O')
      new_board.update('5','O')
      new_board.update('9','O')
      expect(new_board.diagonals_match?).be_true
      end
    end
  end

  describe "#draw?" do

    it "Should return false at the beginning, when all of the cells are empty" do
      expect do
        let(:new_board) { Board.new}
        expect(new_board.draw?).be_false
      end
    end

    it "Should return true if nobody won and there are no cells available" do
      expect do
        let(:new_board) { Board.new}
        new_board.update('1','O')
        new_board.update('2','X')
        new_board.update('3','O')
        new_board.update('4','O')
        new_board.update('5','X')
        new_board.update('6','X')
        new_board.update('7','X')
        new_board.update('8','O')
        new_board.update('9','X')
        expect(new_board.draw?).be_true
      end
    end
  end

  describe "#win?" do

    it "Should return false at the beginning, when all of the cells are empty" do
      expect do
        let(:new_board) { Board.new}
        expect(new_board.win?).be_true
      end
    end

    it "Should return true if either a row, column or diagonal matches with the same token (X or O)" do
      expect do
        new_board = Board.new
        new_board.update('1','O')
        new_board.update('2','O')
        new_board.update('3','O')
        expect(new_board.win?).be_true
      end
    end

    it "Should return false if not all the elements in a row, column or a diagonal match with the same token (X or O)" do
      expect do
        let(:new_board) { Board.new}
        new_board.update('1','O')
        new_board.update('2','X')
        new_board.update('3','O')
        expect(new_board.win?).be_false
      end
    end
  end
end


describe Player do

  describe "#sanitize_choice" do

    it "Should return true if the argument length is equal to 1 and is a valid number between 1 and 9" do
      expect do
        let(:new_board) { Board.new}
        new_board.sanitize_choice('1')
        expect(new_board.sanitize_choice).be_true
      end
    end

    it "Should return false if the argument length is not equal to 1" do
      expect do
        let(:new_board) { Board.new}
        new_board.sanitize_choice('ab')
        expect(new_board.sanitize_choice).be_false
      end
    end

    it "Should return false if the argument is not a valid number between 1 and 9" do
      expect do
        let(:new_board) { Board.new}
        new_board.sanitize_choice('11')
        expect(new_board.sanitize_choice).be_false
      end
    end
  end
end
