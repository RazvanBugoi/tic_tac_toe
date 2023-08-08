# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :board, :player1, :player2, :current_player

  def initialize
    @board = Board.new
    @player1 = nil
    @player2 = nil
    @current_player = nil
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
    @current_player = @player1 # Set the current player to player1 initially

    puts ''
    puts "Thank you, #{@player1_name} is #{@player1_symbol} and #{@player2_name} is #{@player2_symbol}."
    puts ''
  end

  def show_board
    @board.display_board
  end

  def current_player
    @current_player == @player1 ? @player1 : @player2
  end

  def check_winner
    win_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],  # Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8],  # Columns
      [0, 4, 8], [2, 4, 6]              # Diagonals
    ]

    board_state = @board.instance_variable_get(:@board).flatten  # Access the inner @board array directly

    win_combinations.any? do |combo|
      a, b, c = combo
      board_state[a] == board_state[b] && board_state[b] == board_state[c] && %w[X O].include?(board_state[a])
    end
  end

  def check_tie
    board_state = @board.instance_variable_get(:@board).flatten  # Access the inner @board array directly

    # Check if all cells on the board are filled with symbols ('X' or 'O')
    board_state.all? { |cell| cell.is_a?(String) }
  end

  def print_result
    if check_winner
      puts "Congratulations! #{current_player.name} (#{current_player.symbol}) wins!"
    elsif check_tie
      puts "It's a tie! The game is over."
    else
      puts 'The game is still ongoing.'
    end
  end
end
