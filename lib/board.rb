# General Board for TicTacToe, Initializing an empty 3x3 board
class Board
  attr_accessor :board

  def initialize
    @empty = ""
    @board = Array.new(3) { Array.new(3, @empty) }
  end

  def update(mark)
    val1, val2 = input_validation
    board[val1 - 1][val2 - 1] = mark # SELECT BETWEEN "O" AND "X"
  end

  def show
    print "\n     1.   2.   3. \n"

    board.each_with_index do |x, index|
      print index + 1, ". ", x, "\n"
    end
  end

  def check_win
    validate_rows_columns(board)
    validate_rows_columns(board.transpose)
    validate_diagonals(board)
  end

  private

  def new_game
    Game.new.play_game
  end

  def accept_diagonals(array, center)
    return unless array.uniq.length == 1 && center != ""

    puts " \n #{center} Won \n"
    new_game
  end

  def validate_diagonals(board)
    center = board[1][1]
    main = [board[0][0], center, board[2][2]]
    reverse = [board[2][0], center, board[0][2]]

    accept_diagonals(main, center)
    accept_diagonals(reverse, center)
  end

  def validate_rows_columns(board)
    board.each do |val|
      x_mark = 0
      o_mark = 0
      val.each do |mark|
        x_mark += 1 if mark == "X"
        o_mark += 1 if mark == "O"
        if x_mark == 3
          puts "\n X Won \n"
          return new_game
        elsif o_mark == 3
          puts "\n O Won \n"
          return new_game
        end
      end
    end
  end

  def input_validation
    puts "\nInsert Row:"
    val1 = gets.chomp.to_i
    puts "Insert Column:"
    val2 = gets.chomp.to_i
    if (val1 < 1 || val1 > 3) || (val2 < 1 || val2 > 3)
      puts "Please Insert Values Between 1 and 3 (inclusive)"
      return input_validation
    end
    if board[val1 - 1][val2 - 1] != @empty
      puts "Spot already taken, please choose a different one"
      return input_validation
    end
    [val1, val2]
  end
end
