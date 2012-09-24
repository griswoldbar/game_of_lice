class Game
  attr_accessor :board, :cells, :turns
  
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
    start_time = Time.now.tv_sec
    @turns.times do |n| 
      turn = n+1
      loop_time = (Time.now.tv_sec - start_time + 0.1)
      speed = n/loop_time
      Display.render(board,cells, speed)
      advance
    end
  end
  
  def advance
    cells.each do |cell|
      cell.advance1    
    end
    cells.each do |cell|
      cell.advance2    
    end
  end
  
  
end