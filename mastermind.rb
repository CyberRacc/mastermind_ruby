# typed: true
# frozen_string_literal: true

# Contains the game logic
class Mastermind
  def initialize
    @game_board = GameBoard.new
    @game_board.display_board
    @user_interaction = UserInteraction.new
    @player = Player.new(@user_interaction.user_name)
    @computer = Computer.new
  end

  def mode_select
    puts 'Would you like to be the code breaker or guesser?'
    print 'Enter your answer (breaker/guesser): '
    mode = gets.chomp.downcase
    if mode == 'breaker'
      @secret_code = @computer.generate_code(4) # Assuming a 4-color code
    elsif mode == 'guesser'
      # Implement code creation
    else
      puts 'Invalid input'
    end
  end

  def check_guess(guesses) # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity
    code_matched = Array.new(4, false)
    guess_matched = Array.new(4, false)
    correct_positions = 0
    correct_colors_wrong_positions = 0

    guesses.each_with_index do |guess, guess_index|
      @secret_code.each_with_index do |color, color_index|
        if guess == color && guess_index == color_index && !code_matched[color_index] && !guess_matched[guess_index]
          code_matched[color_index] = true
          guess_matched[guess_index] = true
          correct_positions += 1
        elsif guess == color && guess_index != color_index && !guess_matched[guess_index] && !guess_matched[guess_index]
          guess_matched[guess_index] = true
          correct_colors_wrong_positions += 1
        end
      end
    end
    [correct_positions, correct_colors_wrong_positions]
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

  def guess_valid?(guess)
    # Check if the guess is the correct length
    correct_length = guess.length == 4 # Assuming a secret code length of 4

    # Check if every guessed color is in the list of possible colors
    valid_colors = guess.all? { |color| Computer::COLORS.include?(color.to_sym) }
    correct_length && valid_colors # Method returns true if both of theses are valid
  end

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

  def create_code
    # Create a colour code for the CPU to guess.
  end
end

# Contains logic relating to updating, changing and checking the board
class GameBoard
  def initialize
    @game_board = Array.new(12) { Array.new(4) }
  end

  def display_board
    @game_board.each do |row|
      puts row.join(' ')
    end
  end

  def update_board(round, colors)
    @game_board[round] = colors.split # Assuming colors is a string of space-separated colors
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
  COLORS = %i[red blue green yellow black white].freeze

  # This method can be done in one line, `COLORS.sample(code_length)`
  def generate_code(code_length)
    color_code = []

    # Sample method randomly selects an element from the array
    code_length.times { color_code << COLORS.sample }
    color_code
  end
end

Mastermind.new
