# frozen_string_literal: true

# General Board for TicTacToe, Initializing an empty 3x3 board
class Board
  attr_accessor :board

  def initialize
    @empty = ''
    @board = Array.new(3) { Array.new(3, @empty) }
  end

  def update(mark)
    val1, val2 = input_valid
    board[val1 - 1][val2 - 1] = mark # SELECT BETWEEN "O" AND "X"
  end

  def show
    print "\n     1.   2.   3. \n"

    board.each_with_index do |x, index|
      print index + 1, '. ', x, "\n"
    end
  end

  def check_draw
    draw = 0
    board.each do |val|
      val.each do |mark|
        draw += 1 if %w[X O].include?(mark)
        if draw == 9
          puts "\n DRAW \n"
          return new_game
        end
      end
    end
  end

  def check_win
    row_column_valid(board)
    row_column_valid(board.transpose)
    diagonal_valid(board)
  end

  private

  def new_game
    Game.new.play_game
  end

  def accept_diagonals(array, center)
    return unless array.uniq.length == 1 && center != ''

    show
    puts " \n #{center} Won \n"
    new_game
  end

  def diagonal_valid(board)
    center = board[1][1]
    main = [board[0][0], center, board[2][2]]
    reverse = [board[2][0], center, board[0][2]]

    accept_diagonals(main, center)
    accept_diagonals(reverse, center)
  end

  def row_column_valid(board) # rubocop:disable Metrics/MethodLength
    board.each do |val|
      x_mark = 0
      o_mark = 0
      val.each do |mark|
        x_mark += 1 if mark == 'X'
        o_mark += 1 if mark == 'O'
        if x_mark == 3
          show
          puts "\n X Won \n"
          return new_game
        elsif o_mark == 3
          show
          puts "\n O Won \n"
          return new_game
        end
      end
    end
  end

  def input_valid # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    puts "\nInsert Row:"
    val1 = gets.chomp.to_i
    puts 'Insert Column:'
    val2 = gets.chomp.to_i
    if (val1 < 1 || val1 > 3) || (val2 < 1 || val2 > 3)
      puts "\nPlease Insert Values Between 1 and 3 (inclusive)"
      show
      return input_valid
    end
    if board[val1 - 1][val2 - 1] != @empty
      puts "\nSpot already taken, please choose a different one"
      show
      return input_valid
    end
    [val1, val2]
  end
end
