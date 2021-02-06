require_relative 'board'
class Game

  def initialize
    @board = Board.new(30)
  end

  def play
    loop do
      system 'clear'
      @board.render
      @board.next_iteration
      @board.update_cells
      sleep(1)
    end
  end
end
