class Cell

  attr_accessor :content, :adjacent

  def initialize(content=nil, adjacent=nil)
    @content = content
    @adjacent = adjacent
  end

  # width for cell display
  def self.width
    @@total_cells.to_s.size
  end

  # set number of cells
  def self.total_cells=(number_cells)
    @@total_cells = number_cells
  end

  # we try a turn
  def try(turn)

    @content = turn
    return true if turn == @@total_cells
    
    container = []
    adjacent.each_with_index do |cell, n|
      container << [count_adjacent_zero(cell.adjacent)*10+n, cell] if cell.content.zero?
    end

    container.sort.each { |x, cell| return true  if cell.try(turn+1) }
    @content = 0
    false

  end
  
  def count_adjacent_zero(adjacent)
    adjacent.count { |cell| cell.content.zero? }
  end

end