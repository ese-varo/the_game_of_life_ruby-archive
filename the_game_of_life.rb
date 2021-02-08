require_relative 'game'

def ask_for_board_size
  puts 'Please enter the number of rows to create the board: '
  size = gets.chomp.to_i
  (3..100).include?(size) ? Game.new(size) : ask_for_board_size
end

game = ask_for_board_size
game.show_message('welcome.txt')
game.play
