# frozen_string_literal: true

require_relative 'player'

class Board
  def initialize
    @board = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ]
  end

  def display_board
    horizontal_line = "#{'+---' * 3}+"

    @board.each_with_index do |row, _index|
      puts horizontal_line
      row_display = row.map { |cell| " #{cell} " }.join('|')
      puts "|#{row_display}|"
    end

    puts horizontal_line
  end

  def valid_move?(position)
    return false unless position.between?(0, 8) # Check if the position is within the valid range (0 to 8)

    row, col = position.divmod(3) # Convert the position to row and column index

    # Check if the cell at the given position is empty (not occupied by 'X' or 'O')
    @board[row][col].is_a?(Integer)
  end

  def update_cell(position, symbol)
    row, col = position.divmod(3)
    if @board[row][col].is_a?(Integer) # Check if the cell is still a number (not yet taken)
      @board[row][col] = symbol
      true
    else
      false
    end
  end
end
