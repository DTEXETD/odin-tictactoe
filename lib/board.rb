# General Board for TicTacToe, Initializing an empty 3x3 board
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3, "") }
  end

  def update(mark)
    val1, val2 = input_validation
    board[val1 - 1][val2 - 1] = mark # SELECT BETWEEN "O" AND "X"
  end

  def show
    print "     1.   2.   3. \n"

    board.each_with_index do |x, index|
      print index + 1, ". ", x, "\n"
    end
  end

  private

  def input_validation
    puts "\nInsert Row:"
    val1 = gets.chomp.to_i
    puts "Insert Column:"
    val2 = gets.chomp.to_i
    if (val1 < 1 || val1 > 3) || (val2 < 1 || val2 > 3)
      puts "Please Insert Values Between 1 and 3 (inclusive)"
      return input_validation
    end
    [val1, val2]
  end
end
