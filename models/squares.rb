class Square
  attr_accessor :x, :y, :selected, :boat_id, :boat_index, :display
  @@all = []
  @@count = 0
  def self.all
    @@all
  end
  def self.row(row)
    @all.select { |square| square.y == row}
  end
  def self.col(col)
    @all.select { |square| square.x == col}
  end
  def initialize(x, y)
    @id = @@count
    @x = x
    @y = y
    @selected = false
    @display = " "
    @boat_id = nil
    @boat_index = nil
    @@count += 1
    @@all << self
  end
  def select_square
    @selected = true
    if @boat_id != nil
      @display = 'X'
    else
      @display = 'O'
    end
  end
end
