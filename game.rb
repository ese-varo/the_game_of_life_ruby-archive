require_relative 'board'
class Game

  def initialize(board_size)
    @board = Board.new(board_size)
  end

  def play
    loop do
      @board.render
      @board.next_iteration
      @board.update_cells
    end
  end
end
