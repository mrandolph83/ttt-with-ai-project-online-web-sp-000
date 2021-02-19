
class Board
  attr_accessor :cells

  def initialize
      reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input) #Takes in user input & returns the value of the board cell
    user_input.to_i - 1
    index = user_input.to_i - 1
    @cells[index]
  end

  def full?
    @cells.all? {|index| index == "X" || index == "O"}
  end

  def turn_count
      counter = 0
      @cells.each do |player|
      if player == "X" || player == "O"
      counter += 1
    end
    end
      counter
  end

  def taken?(input)
    index = input.to_i-1
    !(@cells[index].nil? || @cells[index] == " ")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    @cells[input.to_i-1] = player.token

  end

  # Try to completely implement input_to_index throughout

end
