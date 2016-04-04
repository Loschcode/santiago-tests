class KnightTour

  require_relative 'board'
  require_relative 'cell'

  def go(rows=8, columns=rows, start_row=rand(rows), start_column=rand(columns))
    Board.new(columns, rows).make.solve(start_column, start_row).draw
  end

end