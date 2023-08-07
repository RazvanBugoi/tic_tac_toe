require_relative 'player'
# Responsible for managing the game board state, including storing the moves made by players.
# Contains methods to display the current state of the board on the command line.
# Provides methods to update the board with valid player moves and check for win/tie conditions.
class Board
  def initialize
    @board = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ]
  end

  def display_board
    @board.each do |element|
      puts "#{element[0]} | #{element[1]} | #{element[2]}"
      puts "---------"
    end
  end
end

