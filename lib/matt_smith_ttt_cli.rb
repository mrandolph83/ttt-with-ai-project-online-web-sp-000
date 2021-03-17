require 'pry'
class MattSmithCLI_TTT


  def call
    comp_one = Players::Computer.new("X")
    comp_two = Players::Computer.new("O")
    human_one = Players::Human.new("X")

    puts "Welcome to Tic Tac Toe!"

    puts "How many players? (Please enter 1-3)"
    puts "[0 (comp v. comp) || 1 (comp. v. human) || 2 (human v. human)]"
    game_choice = gets.strip

    if game_choice == "0"
      Game.new(computer_one, computer_two).play

    elsif game_choice == "1"
      puts "Would you like to take the first turn? [Y/N]"
      input = gets.strip

      if input == "Y"
        Game.new(human_one, comp_two).play
      elsif input == "N"
        Game.new(comp_one).play
      else
        puts "Invalid entry, please try again."
        call
      end
    # binding.pry

      elsif game_choice == "2"
        Game.new.play
      else
        puts "Invalid entry, please try again."
      call
    end
    replay?
  end

  def replay?
    puts "Would you like to play again? [Y/N]"
    input = gets.strip
    if input == "Y"
      call
    elsif input == "N"
      exit
    else
      puts "Invalid entry, please try again."
      replay?
    end
  end
end
