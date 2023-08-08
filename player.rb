# frozen_string_literal: true

class Player
  attr_accessor :name, :symbol

  def initialize(name = 'Unknown', symbol = 'X')
    @name = name
    @symbol = symbol
  end

  def self.validate_symbol(symbol)
    until %w[X O].include?(symbol.upcase)
      puts 'Invalid symbol! Please enter either "X" or "O".'
      symbol = gets.chomp
    end
    symbol.upcase
  end

  def move(board)
    loop do
      puts "#{@name}, it's your turn."
      puts "Please enter the cell number (0-8) where you want to place your symbol (#{@symbol})."
      position = gets.chomp.to_i

      if board.valid_move?(position)
        break if board.update_cell(position, @symbol)

        puts "Sorry, position #{position} is not available. Please make a different selection."

      else
        puts 'Invalid move! Please enter a number between 0 and 8 for an empty cell.'
      end
    end

    board.display_board
  end
end
