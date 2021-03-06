require 'pry'
class Board
  
  attr_accessor :cells
  
  def initialize(cells = Array.new(9," "))
    @cells = cells
  end
  
  def reset!
    @cells.clear
    @cells = Array.new(9," ")
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
    "#{@cells[input.to_i - 1]}"
  end
  
  def full?
    @cells.all? {|position| position != " "}
  end
  
  def turn_count
    @cells.count("X") + @cells.count("O")
  end
  
  def taken?(position)
    @cells[position.to_i - 1] == "X" || @cells[position.to_i - 1] == "O"
  end
  
  def valid_move?(position)
    !taken?(position) && position.to_i > 0 && position.to_i <= 9
  end
  
  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end
  
end