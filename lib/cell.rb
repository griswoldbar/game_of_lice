class Cell
  attr_reader :x, :y, :board, :max_height, :max_width
  attr_accessor :status, :next_status
  
  def initialize(board, x, y)
    @board, @x, @y = board, x, y
    @max_height = board.height - 1
    @max_width = board.width - 1
    @status = board.grid[x][y]
    @next_status = get_next_status
  end
  
  def advance1
    @board.grid[x][y] = @next_status
  end
  
  def advance2
    @status = @board.grid[x][y]
    @next_status = get_next_status
  end
  
  def neighbours
    @neighbours ||= begin
      x_seeds = [x]
      x_seeds << (x - 1) if x > 0
      if x < (max_height)
        x_seeds << (x + 1) 
      end
    
      y_seeds = [y]
      y_seeds << (y - 1) if y > 0
      if y < (max_width)
        y_seeds << (y + 1) 
      end
    
      coords = []
      x_seeds.each do |i|
        y_seeds.each do |j|
          coords << [i, j] unless [i, j] == [x, y]
        end
      end
      coords
    end
  end
  
  def sum_neighbours
    neighbours.reduce(0) do |sum, neighbour|      
      val = @board.grid[neighbour[0]][neighbour[1]]
      sum += val
      sum
    end
  end
  
  def get_next_status
    case
      when (sum_neighbours > 3 or sum_neighbours < 2)
        0
      when sum_neighbours == 3
        1
      when sum_neighbours == 2
        status
    end
  end
  
  
end