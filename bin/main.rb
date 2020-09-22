#!/usr/bin/env ruby

# Ask for player names
puts 'Welcome to our game: Tic Tac Toe'
player1_name = ''
player2_name = ''
player1_choice = ''
player2_choice = ''
answer = ''
game_on = true

def game_confirmation(answer, player1_name, player2_name)
  while (answer != 'y') && (answer != 'n')
    puts 'Do you want to play? (Y/N)'
    answer = gets.chomp.downcase
    game_start(answer, player1_name, player2_name)
  end
end


def ask_choice(player, player1_name, player2_name)
  if player == 1
    puts "#{player1_name}, it is your turn. Choose a square"
    player1_choice = gets.chomp
    # We verify that the choice is valid
    # verify_choice(player1_choice): it will return true or false
    # if verify_choice(player1_choice) == true
      # return player1_choice
    # else
      # we ask again
  else
    puts "#{player2_name}, it is your turn. Choose a square"
    player2_choice = gets.chomp
    # We verify that the choice is valid
    # verify_choice(player2_choice): it will return true or false
    # if verify_choice(player2_choice) == true
      # return player2_choice
    # else
      # we ask again
  end
  # display_board
  # display_board
end


# while game_on
#   # loop for each move
#      valid_choice = false
#     # while valid_choice == false
#     #   ask_choice
      # the ask_choice function will return the choice
      # if player == 1
      #  player1_choice = ask_choice
      # else
      ## player2_choice = ask_choice
#       end
#   if winner # and/or draw (the exact condition in this milestone is not important)
#     game_on = false
#   end
# end



def request_players_info
  print 'Enter the name of player 1: '
  player1_name = gets.chomp
  print 'Enter the name of player 2: '
  player2_name = gets.chomp

  return player1_name, player2_name
end

def game_start(answer, player1_name, player2_name)
  if answer == 'y'
    # Play the game
    player1_name, player2_name = request_players_info
    explain_game
    # This will decide who is going to start
    puts 'The player who will start the game will be chosen randomly'
    puts 'I am thinking...'
    sleep(3)
    player = rand(1..2)
    puts player == 1 ? "#{player1_name} will start, with X!" : "#{player2_name} will start, with O!"
    # The game begins
    puts 'The game begins...'
    # We need to tell each player that it is his/her turn

    ask_choice(player, player1_name, player2_name)

    puts 'The final result is: '
    display_board
    puts 'The winner is...'
    play_again(answer, player1_name, player2_name)
  else
    puts 'Goodbye!'
  end
end



def display_board
  board = [%w[_ _ _], %w[_ _ _], %w[_ _ _]]
  board.length.times do |i|
    board[i].length.times do |j|
      if j == 2
        puts board[i][j]
      else
        print board[i][j] + ' '
      end
    end
  end
  puts ''
end

def play_again(answer, player1_name, player2_name)
  puts 'Do you want to play again? (Y/N)'
  new_game = gets.chomp.downcase
  if new_game == 'y'
    game_start(answer, player1_name, player2_name)
  else
    p 'Good bye!'
  end
end

game_confirmation(answer, player1_name, player2_name)
