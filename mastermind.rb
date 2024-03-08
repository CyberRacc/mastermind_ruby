# typed: true
# frozen_string_literal: true

# Contains the game logic
class Mastermind
  def initialize
    @game_board = GameBoard.new
    @game_board.display_board
    @user_interaction = UserInteraction.new
    @player = Player.new(@user_interaction.user_name)
  end

  def play_game
    current_round = 0

    12.times do
      # Each game should have a maximum of 12 attempts.
      play_round(current_round)
      current_round += 1
    end
  end

  def play_round(round)
    # Round code
    color_choices = @user_interaction.guess_input

    @game_board.update_board(round - 11, color_choices)
  end

  def guess_valid?(guess); end

  def player_guess
    unformatted_guess = @user_interaction.guess_input

    # Splits by space by defualt
    formatted_guess = unformatted_guess.split
    puts formatted_guess
    formatted_guess
  end
end

# Contains logic relevant to getting inputs from the user
class UserInteraction
  def user_name
    print 'Enter your name: '
    gets.chomp.to_s
  end

  def guess_input
    puts "Guess example: 'blue red green yellow'"
    print 'Enter your guess: '
    gets.chomp.to_s
  end
end

# Contains logic relating to updating, changing and checking the board
class GameBoard
  def initialize
    @game_board = Array.new(12) { Array.new(4) }
  end

  def display_board
    @game_board.each do |row|
      puts row
    end
  end

  def update_board(row, colors)
    @game_board.each do |current_row|
      current_row[row] = colors
    end
  end
end

# Player logic, creates the player object as well as getting inputs
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

# Contains logic for the computer including moves,
class Computer
  def generate_code; end
end

Mastermind.new
