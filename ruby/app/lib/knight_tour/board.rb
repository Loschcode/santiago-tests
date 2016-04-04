class Board

  require_relative 'data'

  attr_reader :rows, :columns
 
  def initialize(columns, rows)

    @columns, @rows = columns, rows
    @moves = POSSIBLE_MOVES

    Cell.total_cells = rows * columns
    @format = " | %#{Cell.width}d"

  end

  def draw
    (0...columns).map { |column| (0...rows).map { |row| @format % @board[column][row].content }.join }
  end

  def solve(size_column, size_row)

    raise ArgumentError, "No possible solution" if (columns*rows).odd? and (size_column+size_row).odd?
    return self if @board[size_column][size_row].try(1)
    raise ArgumentError, "No possible solution"

  end

  def update_adjacents
    columns.times do |column| rows.times do |row|
        @board[column][row].adjacent = @moves.map{|d_column,d_row| @board[column+d_column][row+d_row]}.compact
      end
    end
    self
  end

  def make

    max_move = @moves.flatten.map(&:abs).max

    @board = Array.new(columns + max_move) do |array_columns|
      Array.new(rows + max_move) do |array_rows|
        if (array_columns<columns and array_rows<rows)
          Cell.new(0)
        else
           nil
        end
      end
    end
    
    update_adjacents

  end

end
