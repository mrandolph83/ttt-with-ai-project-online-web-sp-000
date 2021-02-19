require 'pry'
module Players

  class Computer < Player

  attr_reader :board

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

# opponent_token

  def move(board)
      @board = board

      opponent_token

      if winning_play != nil
        num = winning_play
      elsif defense_play != nil
        num = defense_play
      else
        num = free_play
      end
        num += 1
        return num.to_s
    end
  # binding.pry

  def winning_play
    win_move = nil
    WIN_COMBINATIONS.find do |win_moves|
    position_1 = board.cells[win_moves[0]]
    position_2 = board.cells[win_moves[1]]
    position_3 = board.cells[win_moves[2]]

    if (position_1 == " " && position_2 == self.token && position_3 == self.token)
      win_move = win_moves[0]
    elsif (position_1 == self.token && position_2 == " " && position_3 == self.token)
      win_move = win_moves[1]
    else (position_1 == self.token && position_2 == self.token && position_3 == " ")
      win_move = win_moves[2]
    end
    end
      win_move
    end


  def opponent_token
    self.token == "X" ? "O" : "X"
  end

  def defense_play
    blocking_move = nil
    WIN_COMBINATIONS.find do |win_moves|
    position_1 = board.cells[win_moves[0]]
    position_2 = board.cells[win_moves[1]]
    position_3 = board.cells[win_moves[2]]

    if (position_1 == " " && position_2 == opponent_token && position_3 == opponent_token)
      blocking_move = win_moves[0]
    elsif (position_1 == opponent_token && position_2 == " " && position_3 == opponent_token)
      blocking_move = win_moves[1]
    else (position_1 == opponent_token && position_2 == opponent_token && position_3 == " ")
      blocking_move = win_moves[2]
    end
  end
      blocking_move
  end

  def free_play
    corners = [0, 2, 6, 8]
    corner_play = corners.find {|corner| board.cells[corner] == " "}
    if corner_play
      return corner_play
    else
      (0..8).to_a.sample
    end
    end
  end



end
