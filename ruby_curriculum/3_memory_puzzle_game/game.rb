require_relative 'card'
require_relative 'board'
require 'set'

class Game
  attr_reader :board, :player
  def initialize(board_size = 10)
    @board = Board.new(board_size)
    @first_guess = nil 
    @second_guess = nil
  end

  def guess
    @first_guess = previous_guess
    @board.deck[@first_guess].reveal
    @board.clear
    @second_guess = current_guess
    @board.deck[@second_guess].reveal
    @board.clear
  end

  def play_round
    guess
    @board.clear
    compare_guesses
  end

  def compare_guesses
    if @board.deck[@first_guess].revealed_value == @board.deck[@second_guess].revealed_value
      puts 'Nice guess!' 
      @board.delete_pairs
    else
      puts 'Please try again'
      @board.reset
    end
    sleep(2)
    @board.clear
  end

  def game_over 
    @board.deck.length < 2
  end

  def previous_guess
    puts "Please pick your first card!"
    puts "Acceptable input is a number between 0 & #{@board.deck.length - 1}"
    gets.chomp.to_i 
  end

  def current_guess
    puts "Please pick your second card!"
    puts "Acceptable input is a number between 0 & #{@board.deck.length - 1}"
    gets.chomp.to_i
  end

  def play
    @board.clear
    play_round until game_over 
  end

end

game_1 = Game.new
game_1.play