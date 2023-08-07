require_relative 'board'
require_relative 'player'
# Orchestrates the flow of the game.
# Manages the instances of the Board and Player classes and their interactions.
# Contains the main game loop that handles player turns,
# checks for win/tie conditions, and updates the board accordingly.

class Game
  def initialize
    @board = Board.new
  end

  def setup_players
    puts 'Player 1, please enter your name'
    @player1_name = gets.chomp
    puts 'Now please enter your symbol (X or O)'
    @player1_symbol = Player.validate_symbol(gets.chomp)
    @player1 = Player.new(@player1_name, @player1_symbol)

    puts 'Player 2, please enter your name'
    @player2_name = gets.chomp
    @player2_symbol = @player1_symbol == 'X' ? 'O' : 'X'
    @player2 = Player.new(@player2_name, @player2_symbol)

    puts "Thank you, #{@player1_name} is #{@player1_symbol} and #{@player2_name} is #{@player2_symbol}."
    puts ""
  end

  def show_board
    @board.display_board
  end
end

game = Game.new
game.setup_players
game.show_board