require_relative 'board'
class Game

  def initialize
    @board = Board.new(100)
  end

  def play
    loop do
      @board.render
      sleep(0.1)
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
