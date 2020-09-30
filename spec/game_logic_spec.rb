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
end
