class Level
  attr_reader :width, :grid, :height
  
  def initialize(raw_level)
    @width = raw_level.shift.length - 1
    @height = raw_level.length
    @grid = raw_level.map do |row|
      row.ljust(width).slice(0...width).split("").map{|y| y.gsub(" ","0").gsub("\n","0").gsub(/[^0]/,"1").to_i }
    end
  end
end