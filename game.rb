require_relative 'board'
class Game
  def play
    loop do
      system 'clear'
      @board.render
      sleep(0.5)
      @board.next_iteration
      @board.update_cells
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

  def ask_for_board_size
    puts 'Please enter the number of rows to create a square board'
    puts 'Valid sizes are between 3 and 100 (just numbers)'
    size = gets.chomp.to_i
    (3..100).include?(size) ? fill_board(size) : ask_for_board_size
  end

  def fill_board(size)
    @board = Board.new(size)
  end
end
