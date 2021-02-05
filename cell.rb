class Cell
  attr_accessor :current_state, :position
  attr_reader :next_state

  def initialize(position, alive)
    @position      = position
    @current_state = alive
    @next_state    = 0
  end

  def alive?
    current_state == 1 ? true : false
  end

  def new_state(neighbors)
    if alive?
      (2..3).include?(neighbors) ? born : kill
    else
      neighbors == 3 ? born : kill
    end
  end

private
  def kill
    @next_state = 0
  end

  def born
    @next_state = 1
  end
end

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
