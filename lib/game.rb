class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],
  ]

  def current_player
    board.turn_count.even? ? @player_1 : @player_2
  end


  def won?
   WIN_COMBINATIONS.each {|win_combo|
     position_1 = board.cells[win_combo[0]]
     position_2 = board.cells[win_combo[1]]
     position_3 = board.cells[win_combo[2]]

     return win_combo if ((position_1 == "X" && position_2 == "X" && position_3 == "X") ||
                         (position_1 == "O" && position_2 == "O" && position_3 == "O"))
   }
    return false
  end

  def draw?
    board.full? && !won? ? true : false
  end

  def over?
    won? || draw? ? true : false
  end

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end

  def turn
    puts "Player #{current_player.token}'s turn!"
    puts "Where would you like to move? (1-9):"
    board.display
# Displays board. Asks for user input from the current player. The #current_player
# method is used to determine which is the current player, and because they are human,
# you use the move(board) method for them to make their move.
    user_input = current_player.move(board)

    if board.valid_move?(user_input)
# Checks whether move is valid
      board.update(user_input, current_player)
# Uses board.update method to make the move, with the current player's token. Updates
# the board with this move.
    else
      puts "Please try again."
      turn
    end
  end

  def play
    until over? == true
    turn
  end

    if won?
      puts "Congratulations #{winner}!"

    elsif
      puts "Cat's Game!"
  end
  end


end
