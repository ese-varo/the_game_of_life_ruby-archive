require_relative 'cell'

class Board
  attr_reader :size, :cells

  def initialize(size)
    @size  = size
    @cells = Array.new(size) do |x|
      Array.new(size) { |y| Cell.new([x, y], random_life) }
    end
  end

  def next_status
    cells.each do |row|
      row.each { |cell| alive_neighbors(cell.position) }
    end
  end

private

  def alive_neighbors(cell_position)
    x, y = cell_position
    neighbor_x = x - 1
    neighbor_y = y - 2
    neighbors = 0
    3.times do
      3.times do
        neighbor_y += 1
        next if (neighbor_x.negative? or neighbor_y.negative?) or
                (neighbor_x >= 3 or neighbor_y >= 3)
        neighbors += b[neighbor_x][neighbor_y] unless (x == neighbor_x && y == neighbor_y)
      end
      neighbor_x += 1
      neighbor_y = y - 2
    end
    cell.update_state(neighbors)
  end
  
  def living?
    1
    # create random numbers module
  end
end

b = Board.new(3)
b.render
b.next_iteration
b.update_cells
b.render

=begin

  -------------------------
  x-1,y-1 | x-1,y | x-1,y+1
  --------|-------|--------
  x,y-1   | (x,y) | x,y+1
  --------|-------|--------
  x+1,y-1 | x+1,y | x+1,y+1
  -------------------------

=end
