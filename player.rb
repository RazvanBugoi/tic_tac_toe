# Represents each player participating in the game.
# Stores player-specific information, such as their name and assigned symbol (X or O).
# Can have methods to prompt the player for their move or handle other player-related tasks.
class Player
  attr_accessor :name, :symbol

  def initialize(name = 'Unknown', symbol = 'X')
    @name = name
    @symbol = symbol
  end

  def move(board)
    # Implement the logic to get the player's move (input) and update the board
    # The 'board' parameter allows the player to interact with the game board
    # and update it based on their move.
  end

  def self.validate_symbol(symbol)
    until ['X', 'O'].include?(symbol.upcase)
      puts 'Invalid symbol! Please enter either "X" or "O".'
      symbol = gets.chomp
    end
    symbol.upcase
  end
end
