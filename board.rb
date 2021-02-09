require_relative 'cell'

class Board
  attr_reader :size, :cells

  def initialize(size = 100)
    @size  = size
    @cells = capture_cells
  end

  def update_cells
    cells.each do |row|
      row.each { |cell| cell.current_state = cell.next_state }
    end
  end

  def render
    cells.each do |row|
      row.each { |cell| print cell }
      puts
    end
    puts "Press \"ctrl + z\" to exit"
  end

  def next_iteration
    cells.each do |row|
      row.each do |cell|
        neighbors = alive_neighbors_counter(cell.position)
        cell.new_state(neighbors)
      end
    end
  end

private

  def alive_neighbors_counter(cell_position)
    states = set_neighbor_states(cell_position)
    3.times do
      3.times { seek_alive_neighbors(states) }
      states[:neighbor_x] += 1
      states[:neighbor_y] = states[:y] - 2
    end
    states[:neighbors] -= cells[states[:x]][states[:y]].alive? ? 1 : 0
  end

  def seek_alive_neighbors(states)
    states[:neighbor_y] += 1
    unless out_of_board?(states[:neighbor_x], states[:neighbor_y])
      states[:neighbors] += 1 if cells[states[:neighbor_x]][states[:neighbor_y]].alive?
    end
  end

  def set_neighbor_states(position)
    {
      neighbor_x: position[0] - 1,
      neighbor_y: position[1] - 2,
      neighbors: 0,
      x: position[0],
      y: position[1]
    }
  end

  def out_of_board?(x, y)
    [x, y].min.negative? || [x, y].max >= size
  end

  def capture_cells
    Array.new(size) do |x|
      Array.new(size) { |y| Cell.new([x, y], random_life) }
    end
  end

  def random_life
    rand(1..100) > 40 ? 0 : 1
  end
end
