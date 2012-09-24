class Display

  def self.render(board, cells, info)
    system('clear')
    last_row = 0
    str = ""
    cells.each do |cell|
      row = cell.x
      if row == last_row
        str << board.grid[cell.x][cell.y].to_s.gsub("1", "x").gsub("0", " ")
      else
        puts str
        str = board.grid[cell.x][cell.y].to_s.gsub("1", "x").gsub("0", " ")
      end
      last_row = cell.x
    end
    puts str
    puts "speed: #{info}"
  end
  
end