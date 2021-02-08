require_relative 'board'
class Game

  def initialize(size = 100)
    @board = Board.new(size)
  end

  def play
    loop do
      @board.render
      sleep(0.5)
      @board.next_iteration
      @board.update_cells
      system 'clear'
    end
  end

  def show_message(file)
    system 'clear'
    File.foreach(file) do |line|
      puts line
      sleep(0.1)
    end
    sleep(1)
  end
end
