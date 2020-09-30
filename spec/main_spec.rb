#spec/main_spec.rb
require_relative '../bin/main.rb'

describe "#game_confirmation" do

  it "Should capture the input and downcase it" do
    allow($stdin).to receive(:gets).and_return('y')

    expect { main } # (Or however you run it!)
      .to output('Do you want to play? (Y/N)')
      .to_stdout
  end
end


#   it "Should capture the input and downcase it" do
#     expect do
#       expect(game_confirmation('Yes')).to eq('Yes')
#     end
#   end
# end
