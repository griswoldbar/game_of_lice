class Game
  attr_accessor :board, :cells
  
  def initialize(level_id=1, turns = 50)
    @turns = turns
    level_data_array = GetFromFile.get_levels
    level = Level.new(level_data_array[level_id - 1])
    @board = Board.new(level)
    @cells = Array.new
    @board.grid.each_with_index do |column, x|
      column.each_with_index do |item, y|
        @cells << Cell.new(@board, x, y)
      end
    end
  end
  
  def play
    @turns.times do
      Display.render(board,cells)
      sleep 1
      advance
    end
  end
  
  def advance
    cells.map(&:advance)
  end
  
  
end