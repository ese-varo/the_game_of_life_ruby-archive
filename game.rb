require_relative 'board'
class Game

  def initialize
    @board = Board.new(4)
  end

  def play
    5.times do
      # system 'clear'
      @board.render
      puts
      @board.next_iteration
      @board.update_cells
      # sleep(2)
    end
  end
end
