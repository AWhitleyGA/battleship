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
  end
  def create_squares
    coordinates = @grid_rows.product(@grid_columns)
    coordinates.each do |coord|
      @squares << Square.new(coord[0], coord[1])
    end
  end
end
