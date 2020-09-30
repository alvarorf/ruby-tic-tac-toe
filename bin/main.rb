#!/usr/bin/env ruby
require_relative '../lib/game_logic.rb'
player1_name = ''
player2_name = ''
answer = ''


def explain_game
  puts "1. The game is played on a grid that's 3 squares by 3 squares."
  puts '2. Player 1 is X and player 2 is O.'
  puts '3. Players take turns putting their marks in empty squares.'
  puts '4. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.'
  puts '5. When all 9 squares are full, the game is over.'
end

def request_players_info(start)
  print 'Enter the name of player 1: '
  player1_name = gets.chomp
  print 'Enter the name of player 2: '
  player2_name = gets.chomp
  puts 'The player who will start the game will be chosen randomly'
  puts 'I am thinking...'
  sleep(3)
  puts start == 1 ? "#{player1_name} will start, with X!" : "#{player2_name} will start, with O!"
  return player1_name, player2_name
end

def win_or_draw?(board, player_name)
  if board.win?
    puts "Hey, #{player_name}, you won!!!"
    return true
  elsif board.draw?
    puts "It's a draw!!!"
    return true
  end
  return false
end

def choice_validator(player, choice, new_board)
  player.sanitize_choice(choice) && new_board.valid_cell?(choice) ? true : false
end

def init_game
  turn = rand(1..2)
  new_board = Board.new
  explain_game
  player1 = Player.new
  player1.player_movement = 'X'
  player2 = Player.new
  player2.player_movement = 'O'
  player1.name, player2.name = request_players_info(turn)
  return new_board, player1, player2, turn
end

def play(player, board, game_on, token)
  puts "#{player.name}, it's you turn choose a square"
  choice = gets.chomp
  until choice_validator(player, choice, board)
    board.display
    puts 'Incorrect choice, please choose a number from 1 to 9: '
    choice = gets.chomp

  end
  board.update(choice, token)
  board.display
  return !win_or_draw?(board, player.name)
end

def game_start(answer, player1, player2, turn, new_board)
  game_on = true
  counter = 1
  player1_name = player1.name
  player2_name = player2.name
  while game_on && counter <= 9
    if turn == 1
      game_on = play(player1, new_board, game_on, 'X')
      turn = 2
    else
      game_on = play(player2, new_board, game_on, 'O')
      turn = 1
    end
    counter += 1
  end
  puts 'The final result is: '
  new_board.display
  play_again(answer, player1_name, player2_name, turn)
end

def play_again(answer, player1_name, player2_name, turn)
  puts 'Do you want to play again? (Y/N)'
  new_game = gets.chomp.downcase
  while new_game != 'y' && new_game != 'n'
    puts "It's not a correct option, chose... (Y/N)"
    new_game = gets.chomp.downcase
  end
  if new_game == 'y'
    new_board, player1, player2, turn = init_game
    game_start(answer, player1, player2, turn, new_board)
  else
    puts 'See you next time!'
  end
end

def main
  puts 'Do you want to play? (Y/N)'
  puts 'Welcome to our game: Tic Tac Toe'

  answer = gets.chomp.downcase

  if answer == 'n'
    puts 'Goodbye!'
    return
  elsif answer == 'y'
    new_board, player1, player2, turn = init_game
    game_start(answer, player1, player2, turn, new_board)
  else
    main
  end
end

main
