class Cell
  attr_accessor :state, :position
  private       :state

  def initialize(position, alive)
    @position = position
    @state = { current: alive, next: 0}
  end

  def alive?
    state[:current] == 1 ? true : false
  end

  def update_state(neighbors)
    if alive?
      kill unless (2..3).include?(neighbors)
    else
      born if neighbors == 3
    end
  end

private
  def kill
    state[:next] = 0
  end

  def born
    state[:next] = 1
  end
end

# cell = Cell.new([1, 2], 1)
# puts cell.alive?
# cell.alive = false
# puts cell.alive?

=begin

  -------------------------
  x-1,y-1 | x-1,y | x-1,y+1
  --------|-------|--------
  x,y-1   | (x,y) | x,y+1
  --------|-------|--------
  x+1,y-1 | x+1,y | x+1,y+1
  -------------------------

  - determine if it's alive or dead
    - it will handle two 'states'; current and next
  - its position in the board: (x, y)
  - number of alive neighbours
=end
