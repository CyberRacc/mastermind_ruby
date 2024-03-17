# frozen_string_literal: true

# Contains the utility methods
module Utility
  def self.clear_screen
    system 'clear' || 'cls'
  end
end

# Contains the game logic
class Mastermind # rubocop:disable Metrics/ClassLength
  include Utility

  def initialize
    @game_board = GameBoard.new
    @user_interaction = UserInteraction.new
    @player = Player.new(@user_interaction.user_name)
    @computer = Computer.new
    @game_board.display_board
    @secret_code = []
    @user_interaction.welcome(@player.name)
    choose_mode
  end

  def play_game
    puts 'Game Start!'
    round = 1
    while round <= 12
      puts "Round #{round}"
      play_round(round - 1)
      round += 1
    end
    game_over
  end

  def play_round(round)
    player_guesses = nil
    loop do
      player_guesses = player_guess
      break if guess_valid?(player_guesses)

      puts 'Invalid guess. Please make sure your guess includes 4 valid colors.'
    end

    feedback = guess_feedback(player_guesses)
    @game_board.update_board(round, player_guesses, feedback)
    @game_board.display_board
    check_win(player_guesses)
  end

  def guess_counter(guesses)
    correct_color_and_position = guess_matches_code(guesses)

    remaining_secret_code = @secret_code.dup
    remaining_guesses = guesses.map.with_index do |guess, index|
      guess unless guess == remaining_secret_code[index]
    end.compact

    remaining_secret_code.compact!

    correct_color_wrong_position = correct_colors_wrong_positions(remaining_secret_code, remaining_guesses)

    [correct_color_and_position, correct_color_wrong_position]
  end

  def correct_colors_wrong_positions(remaining_secret_code, remaining_guesses)
    correct_color_wrong_position = 0

    remaining_guesses.each do |guess|
      index = remaining_secret_code.index(guess)
      unless index.nil?
        remaining_secret_code[index] = nil
        correct_color_wrong_position += 1
      end
    end

    correct_color_wrong_position
  end

  def guess_feedback(guesses)
    correct_color_and_position, correct_color_wrong_position = guess_counter(guesses)
    feedback = [correct_color_and_position, correct_color_wrong_position]

    # For debugging or direct feedback, you can still print the values
    puts "Correct color and position: #{correct_color_and_position}"
    puts "Correct color, wrong position: #{correct_color_wrong_position}"

    feedback
  end

  def guess_matches_code(guesses)
    correct_color_and_position = 0

    guesses.each_with_index do |guess, index|
      correct_color_and_position += 1 if guess == @secret_code[index]
    end

    correct_color_and_position
  end

  def guess_valid?(guesses)
    # Check if the guess is the correct length
    correct_length = guesses.length == 4 # Assuming a secret code length of 4

    # Check if every guessed color is in the list of possible colors
    valid_colors = guesses.all? { |color| Computer::COLORS.include?(color.to_sym) }
    correct_length && valid_colors # Method returns true if both of theses are valid
  end

  def player_guess
    format_guess(@user_interaction.guess_input)
  end

  def computer_guesses
    guess = nil
    feedback = nil
    12.times do |round|
      puts "Computer's turn #{round + 1}"
      guess = @computer.guess_code(feedback) # Pass feedback here
      feedback = guess_feedback(guess) # Generate feedback based on the guess
      @game_board.update_board(round, guess, feedback)
      @game_board.display_board
      break if code_guessed?(guess)
    end
    puts 'The computer could not guess your code!' unless code_guessed?(guess)
    puts 'Well done!' unless code_guessed?(guess)
    puts 'The computer guessed your code!' if code_guessed?(guess)
    @user_interaction.play_again
  end

  def choose_mode # rubocop:disable Metrics/MethodLength
    mode = nil

    # Loop until the user selects a valid mode
    until %w[breaker creator].include?(mode)
      mode = @user_interaction.mode_select
      case mode
      when 'breaker'
        @secret_code = @computer.generate_code(4)
        play_game
      when 'creator'
        @secret_code = @user_interaction.code_input(Computer::COLORS)
        computer_guesses
      else
        puts 'Invalid input'
      end
    end
  end

  def check_win(guesses)
    return unless code_guessed?(guesses)

    game_over
  end

  def game_over
    Utility.clear_screen
    @game_board.display_board
    puts 'Game Over!'
    puts "You won!\n" if code_guessed?
    @user_interaction.play_again
  end

  def code_guessed?(guesses)
    guesses == @secret_code
  end

  # Splits the guess into an array
  def format_guess(guesses)
    guesses.downcase.split.map(&:to_sym) # Convert each guess string to a symbol
  end
end

# Contains logic relevant to getting inputs from the user
class UserInteraction
  include Utility

  def welcome(name)
    puts "Hello, #{name}! Welcome to Mastermind!"
  end

  def user_name
    print 'Enter your name: '
    gets.chomp.to_s.downcase.capitalize
  end

  def guess_input
    puts "\nPossible colors: #{Computer::COLORS.join(' ')}\n\n"
    puts "Guess example: 'blue red green yellow'"
    puts 'Code can be up to 4 colors.'
    print 'Enter your guess: '
    gets.chomp.to_s
  end

  def code_input(colors)
    puts 'Create a code for the CPU to guess!'
    puts 'You can choose these colors:'
    colors.each { |color| print "#{color} " }
    puts "\nPlease enter your selection of colors with spaces."
    puts 'Example: blue white yellow red'
    print 'Enter your code: '
    gets.chomp.to_s.downcase.split.map(&:to_sym) # Convert the input into an array of symbols
  end

  def mode_select
    puts 'Would you like to be the code breaker or guesser?'
    print 'Enter your answer (breaker/creator): '
    gets.chomp.to_s.downcase
  end

  def play_again
    print 'Would you like to play again? (yes/no): '
    answer = gets.chomp.to_s.downcase
    if answer == 'yes'
      Utility.clear_screen
      Mastermind.new
    else
      puts 'Goodbye!'
    end
  end
end

# Contains logic relating to updating, changing and checking the board
class GameBoard
  def initialize
    @game_board = Array.new(12) { { guess: Array.new(4, '-'), feedback: [] } }
  end

  def clear_board
    @game_board = Array.new(12) { { guess: Array.new(4, '-'), feedback: [] } }
  end

  def display_board
    puts "\nBoard:\n\n"
    @game_board.reverse_each do |entry|
      guess_str = entry[:guess].join(' ').upcase # Convert symbols to uppercase strings for display
      feedback_str = entry[:feedback].empty? ? '[]' : entry[:feedback].inspect
      puts "#{guess_str}  #{feedback_str}"
    end
    puts "\n"
  end

  def update_board(round, guess, feedback)
    @game_board[round][:guess] = guess # Assuming guess is an array of symbols or strings
    @game_board[round][:feedback] = feedback # Assuming feedback is an array like [2, 1]
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
  attr_accessor :possible_colors, :eliminated_colors, :last_guess

  # The colors the computer can choose from
  # The %i[] syntax is used to create an array of symbols
  COLORS = %i[red blue green yellow black white purple pink orange brown].freeze

  def initialize
    @possible_colors = COLORS.dup # The dup method is used to create a new array with the same elements
    @eliminated_colors = []
    @last_guess = []
  end

  def generate_code(code_length)
    COLORS.sample(code_length).uniq
  end

  def guess_code(feedback = nil)
    # For the first guess, the computer will just guess 4 random colors
    if feedback.nil? || feedback == [0, 0]
      @last_guess = generate_code(4)
      return @last_guess
    else
      refine_guess(feedback)
    end
    @last_guess
  end

  def refine_guess(feedback)
    # Assuming feedback format is [correct_position, correct_color_wrong_position]
    correct_position, correct_color_wrong_position = feedback

    # Strategy to keep correct-position colors and shuffle others
    new_guess = Array.new(4)
    correct_colors = []

    @last_guess.each_with_index do |color, index|
      if correct_position > 0 # If there are colors in the correct position
        new_guess[index] = color
        correct_position -= 1
      elsif correct_color_wrong_position > 0 # Correct color but wrong position
        correct_colors << color
        correct_color_wrong_position -= 1
      end
    end

    # Fill in the gaps with remaining possible colors, avoiding duplicates
    new_guess.map! do |color|
      color || (@possible_colors - new_guess - correct_colors).sample
    end

    # Ensure correct colors are included, possibly shuffled
    new_guess = new_guess.map { |color| correct_colors.include?(color) ? correct_colors.shuffle!.pop : color }

    @last_guess = new_guess.uniq
    @last_guess = @last_guess.sample(4) while @last_guess.size < 4
  end
end

Mastermind.new
