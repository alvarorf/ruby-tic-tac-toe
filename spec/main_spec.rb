#spec/main_spec.rb
require_relative '../bin/main.rb'

describe "#game_confirmation" do

  it "Should capture the input and downcase it" do
    #game_confirmation #.to receive(:gets).and_return('foo')
    name = game_confirmation #.gets

    expect(name).to eq('yes')
  end
end


#   it "Should capture the input and downcase it" do
#     expect do
#       expect(game_confirmation('Yes')).to eq('Yes')
#     end
#   end
# end
