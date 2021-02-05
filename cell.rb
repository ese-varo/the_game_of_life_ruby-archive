class Cell
  attr_accessor :state
  private       :state
  attr_writer :position

  def initialize(position, alive)
    @position = position
    @state = { current: alive, next: false }
  end

  def alive?
    
  end


end

=begin
  - determine if it's alive or dead
    - it will handle two 'states'; current and next
  - its position in the board: (x, y)
  - number of alive neighbours
=end
