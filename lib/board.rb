class Board
  # attr_reader :width, :height
  attr_accessor :level
  
  def initialize(level)
    @level = level
  end
  
  def method_missing(method, *args)
    if level.respond_to?(method)
      level.send(method, *args)
    else
      super
    end
  end
  
end
