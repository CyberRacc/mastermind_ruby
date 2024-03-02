# typed: true
# frozen_string_literal: true

# Contains the main game logic
class Mastermind
  def initialize
    @player = Player.new(gets.chomp.capitalize.to_s)
    @computer = Computer.new('Computer')
    @board = Board.new
    @board.display
  end
end

# Computer class
class Computer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def generate_code
    code = []
    4.times do
      code.push(rand(1..6))
    end
    code
  end

  def guess
    guess = []
    4.times do
      guess.push(rand(1..6))
    end
    guess
  end
end

# Board class
class Board
  attr_reader :board

  def initialize
    # 12 rows and 4 columns
    @board = Array.new(12) { Array.new(4, ' ') }
  end

  def display
    puts '\n'
    @board.each do |row|
      puts row.join(' ')
    end
    puts '\n'
  end

  def update(row, column, value)
    @board[row][column] = value
  end

  def valid_move?(row, column)
    @board[row][column] == ' '
  end
end

# Player class
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

GameManager.new
