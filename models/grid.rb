class Grid
attr_accessor :grid_width, :grid_height, :squares
  def initialize
    @squares = []
    @boat_one = [1, 2, 3, 4, 5]
    @boat_two = [1, 2, 3, 4, 5]
    @grid_width = 10
    @grid_height = 10
    @grid_rows = (1..@grid_width).to_a
    @grid_columns = (1..@grid_height).to_a
    self.create_squares
  end
  def place_ships

  end
  def create_squares
    coordinates = @grid_rows.product(@grid_columns)
    coordinates.each do |coord|
      @squares << Square.new(coord[0], coord[1])
    end
  end
  def create_row_border
    puts "+---" * 10 + "+"
  end
  def render_board
    index = 0
    @grid_rows.length.times do
    create_row_border
    row = "|"
      @grid_columns.length.times do
        row += " #{@squares[index].display} |"
        index += 1
      end
    puts row
    end
    create_row_border
  end


end
