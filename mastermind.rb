# frozen_string_literal: true

# Contains the game logic
class Mastermind
  def initialize
    @game_board = GameBoard.new
    @user_interaction = UserInteraction.new
    @player = Player.new(@user_interaction.user_name)
    @computer = Computer.new
    @game_board.display_board
    @secret_code = []
    game_manager
  end

  def game_manager
    welcome
    choose_mode
  end

  def welcome
    puts 'Welcome to Mastermind!'
  end

  def play_game
    puts 'Game Start!'
    round = 11
    while round >= 0 # 0 is final round
      puts "Round #{round}"
      play_round
      round -= 1
    end
  end

  def play_round
    # Round code
    guesses = player_guess

    puts guesses

    # The plus 11 is to allow the rounds to build up from the bottom
    guess_feedback(guesses, @secret_code)
  end

  def guess_counter(guesses, secret_code)
    puts "Debug: Original Secret Code: #{secret_code.inspect}"
    correct_color_and_position = guess_matches_code(guesses, secret_code)

    remaining_secret_code = secret_code.dup
    remaining_guesses = []

    guesses.each_with_index do |guess, index|
      if guess == remaining_secret_code[index]
        remaining_secret_code[index] = nil
      else
        remaining_guesses.push(guess)
      end
    end

    puts "Debug: Remaining Secret Code after position match removal: #{remaining_secret_code.inspect}"
    puts "Debug: Remaining Guesses: #{remaining_guesses.inspect}"

    correct_color_wrong_position = remaining_guesses.count do |guess|
      if remaining_secret_code.include?(guess)
        remaining_secret_code[remaining_secret_code.index(guess)] = nil
        true
      else
        false
      end
    end

    puts "Debug: Correct Color and Position: #{correct_color_and_position}, Correct Color, Wrong Position: #{correct_color_wrong_position}"

    [correct_color_and_position, correct_color_wrong_position]
  end

  def guess_feedback(guesses, secret_code)
    correct_color_and_position, correct_color_wrong_position = guess_counter(guesses, secret_code)
    puts "Debug: Original Secret Code: #{secret_code.inspect}"
    puts "Debug: Guesses: #{guesses.inspect}"
    puts "Correct Color and Position: #{correct_color_and_position}, Correct Color, Wrong Position: #{correct_color_wrong_position}"
  end

  def guess_matches_code(guesses, secret_code)
    correct_color_and_position = 0

    guesses.each_with_index do |guess, index|
      correct_color_and_position += 1 if guess == secret_code[index]
    end

    correct_color_and_position
  end

  def guess_valid?(guess)
    # Check if the guess is the correct length
    correct_length = guess.length == 4 # Assuming a secret code length of 4

    # Check if every guessed color is in the list of possible colors
    valid_colors = guess.all? { |color| Computer::COLORS.include?(color.to_sym) }
    correct_length && valid_colors # Method returns true if both of theses are valid
  end

  def player_guess
    format_guess(@user_interaction.guess_input)
  end

  def choose_mode
    mode = nil
    until %w[breaker creator].include?(mode)
      mode = @user_interaction.mode_select
      case mode
      when 'breaker'
        @secret_code = @computer.generate_code(4)
        play_game
      when 'creator'
        @secret_code = @user_interaction.code_input(Computer::COLORS)
      else
        puts 'Invalid input'
      end
    end
  end

  def game_finished
    # If the code was guessed, declare the winner
    # If the player fails to guess, put 'you lose'
  end

  # Splits the guess into an array
  def format_guess(guesses)
    guesses.split.map(&:to_sym) # Convert each guess string to a symbol
  end
end

# Contains logic relevant to getting inputs from the user
class UserInteraction
  def user_name
    print 'Enter your name: '
    gets.chomp.to_s
  end

  def guess_input
    puts 'Possible colors: red blue green yellow black white'
    puts "Guess example: 'blue red green yellow'"
    print 'Enter your guess: '
    gets.chomp.to_s
  end

  def code_input(colors)
    puts 'Create a code for the CPU to guess!'
    puts 'You can choose these colors:'
    colors.each { |color| print "#{color} " }

    puts 'Please enter your selection of colors with spaces.'
    puts 'Example'
    puts 'blue white yellow red'
    print 'Enter your code: '

    gets.chomp.to_s.downcase
  end

  def mode_select
    puts 'Would you like to be the code breaker or guesser?'
    print 'Enter your answer (breaker/creator): '
    gets.chomp.to_s.downcase
  end
end

# Contains logic relating to updating, changing and checking the board
class GameBoard
  def initialize
    @game_board = Array.new(12) { Array.new(4, '-') }
  end

  def clear_board
    @game_board = Array.new(12) { Array.new(4, '-') }
  end

  def display_board
    puts "\n"
    puts 'The board:'
    @game_board.each do |row|
      puts row.join(' ')
    end
    puts "\n"
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
  # The colors the computer can choose from
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
