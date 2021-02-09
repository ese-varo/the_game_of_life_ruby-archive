require_relative 'game'

game = Game.new
game.ask_for_board_size
game.show_message('welcome.txt')
game.play
