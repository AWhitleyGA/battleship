class Grid
attr_accessor :grid_width, :grid_height, :squares, :boat_one_coords, :boat_two_coords
  def initialize
    @squares = []
    @boat_one = [1, 2, 3, 4, 5]
    @boat_one_coords = []
    @boat_two = [1, 2, 3, 4, 5]
    @boat_two_coords = []
    @grid_width = 10
    @grid_height = 10
    @grid_rows = (1..@grid_width).to_a.reverse
    @grid_columns = (1..@grid_height).to_a
    self.create_squares
    self.render_board
    self.place_boats
  end
  def guess_square(y, x)
    coords = [x, y]
    square = @squares.select { |square| square.x == x && square.y == y}.pop
    boats = @boat_one_coords + @boat_two_coords
      if boats.include?(coords)
        square.display = 'X'
      else
        square.display = 'O'
      end
    render_board
  end
  def place_boats
    boats = [@boat_one_coords, @boat_two_coords]
    boats.each do |boat|
      initial_x = rand(1..@grid_width)
      initial_y = rand(1..@grid_height)
      direction = rand(1..2)
      if direction == 1
        if initial_x > 6
          x_coords = [initial_x, initial_x - 1, initial_x - 2, initial_x - 3, initial_x - 4]
        else
          x_coords = [initial_x, initial_x + 1, initial_x + 2, initial_x + 3, initial_x + 4]
        end
        x_coords.each { |x| boat << [x, initial_y]}
      elsif direction == 2
        if initial_y > 6
          y_coords = [initial_y, initial_y - 1, initial_y - 2, initial_y - 3, initial_y - 4]
        else
          y_coords = [initial_y, initial_y + 1, initial_y + 2, initial_y + 3, initial_y + 4]
        end
        y_coords.each { |y| boat << [initial_x, y]}
      end
    end
  end
  def render_board
    index = 0
    @grid_rows.length.times do |row|
    create_row_border
    row > 0? row_display = "#{10 - row}  |" : row_display = "10 |"

      @grid_columns.length.times do
        row_display += " #{@squares[index].display} |"
        index += 1
      end
    puts row_display
    end
    create_row_border
    puts "     1   2   3   4   5   6   7   8   9   10"
  end
  def create_row_border
    puts "   " + "+---" * 10 + "+"
  end
  def create_squares
    coordinates = @grid_rows.product(@grid_columns)
    coordinates.each do |coord|
      @squares << Square.new(coord[0], coord[1])
    end
  end
end
