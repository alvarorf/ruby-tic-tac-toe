#spec/main_spec.rb
require '../lib/game_logic.rb'
new_board = Board.new
#empty_board = [%w[_ _ _], %w[_ _ _], %w[_ _ _]]
empty_board = "_ _ _\n_ _ _\n_ _ _\n\n"
puts empty_board
#puts new_board.display
#puts new_board.display
#print new_board.display
puts (new_board.display == empty_board)

=begin
describe Board do
  describe "#display" do
    it "displays the board" do
      new_board = Board.new
      empty_board = [%w[_ _ _], %w[_ _ _], %w[_ _ _]]
      expect(new_board.display.to eql(empty_board))
    end
  end
end
=end
