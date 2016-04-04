class KnightTour

  require_relative 'board'
  require_relative 'cell'

  def go(rows=8, columns=rows, start_column=rand(columns), start_row=rand(rows))
    Board.new(columns, rows).make.solve(start_column, start_row).draw
  end

end