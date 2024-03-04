# typed: true
# frozen_string_literal: true

# Contains the game logic
class Mastermind
  def initialize
    @game_board = GameBoard.new
  end
end

# Contains logic relating to updating, changing and checking the board
class GameBoard
  def initialize
    @game_board = Array.new(12) { Array.new(4) }
  end

  def show_game_board
    puts @game_board
  end
end

# Player logic, creates the player object as well as getting inputs
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess_input
    puts "Guess example: 'blue red green yellow"
    print 'Enter your guess: '
    gets.chomp
  end
end

# Contains logic for the computer including moves,
class Computer
  def generate_code; end
end
