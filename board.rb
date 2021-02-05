require_relative 'cell'

class Board
  attr_reader :size, :cells

  def initialize(size)
    @size  = size
    @cells = Array.new(size) do |x|
      Array.new(size) { |y| Cell.new([x, y], living?) }
    end
  end

private
  
  def living?
    true
  end
end

b = Board.new(3)
pp b.cells

=begin

  -------------------------
  x-1,y-1 | x-1,y | x-1,y+1
  --------|-------|--------
  x,y-1   | (x,y) | x,y+1
  --------|-------|--------
  x+1,y-1 | x+1,y | x+1,y+1
  -------------------------

=end
