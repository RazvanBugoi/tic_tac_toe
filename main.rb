require_relative 'game'
require_relative 'player'

def play_again?
  puts 'Do you want to play again? (Y/N)'
  response = gets.chomp.downcase
  response == 'y'
end

def start_game
  loop do 
    game = Game.new
    game.setup_players
    game.show_board

    # Loop for the game until it ends (e.g., someone wins or it's a tie)
    loop do
      game.current_player = game.player1  # Set the current player to player1
      game.player1.move(game.board)  # Pass the player object to the move method
      #game.show_board
      break if game.check_winner || game.check_tie

      game.current_player = game.player2  # Set the current player to player2
      game.player2.move(game.board)  # Pass the player object to the move method
      #game.show_board
      break if game.check_winner || game.check_tie
    end

    game.print_result

    break unless play_again?
  end
end

start_game