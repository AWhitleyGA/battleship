require_relative "models/squares"
require_relative "models/grid"

puts "Welcome to Battlship \n Press Enter to Play"
gets

grid = Grid.new



loop do
  puts "Enter two coordinates and press enter to fire torpedoes \n Ex: 1, 2 \n type 'ctrl + c' to quit"
  begin
  choice = gets.chomp.split(',')
  x = choice[0].to_i
  y = choice[1].to_i
  grid.guess_square(x, y)
  rescue
  grid.render_board
  end
end
