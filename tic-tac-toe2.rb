class Array
  def same_values?
    self.uniq.length == 1
  end
end

class Game
  def initialize
    @signs = [ ["11", "12", "13"], ["21", "22", "23"], ["31", "32", "33"] ]
  end 
  # Ask user if he wants to play with Ai or second player 
  def secondplayer
    puts "Do you want to play with AI? y/n?"
    ats = gets.chomp
    if ats == "y"
      player = Computer.new
    else
      player = Player.new
    end
    player
  end
  # Creates player array with random positions
  def player_array(player_a, player_b)
    players = []
    players[rand(2)] = player_a
    if players[0].nil?
      players[0] = player_b
    else
      players[1] = player_b
    end
    players
  end
  # Starts game by anouncing who goes first and asigns signs
  def start(players)
    puts "#{players[0].name} goes first, sign - x"
    players[0].sign = "x "
    puts "#{players[1].name} goes second, sign - o"
    players[1].sign = "o "
    puts "Start game"
  end
  # Plays game until someone wins
  def play(players)
    while !win?
      players.each do |player|
        self.draw
        puts "#{player.name} turn with #{player.sign}"
        self.write(player)
        if win?
          puts "#{player.name} wins!"
          exit
        end
      end
    end
  end
  # Writes chosen position to cell
  def write(player)
    begin
      position = player.choose_position 
    end until self.empty_cell?(position)
    @signs[position[0].to_i-1][position[1].to_i-1] = player.sign
  end
  # Checks if cell is empty 
  def empty_cell?(position)
    case @signs[position[0].to_i-1][position[1].to_i-1]
    when "x " 
      return false
    when "o " 
      return false
    else return true
    end
  end
  # Draws game board
  def draw
    @signs.each do |i|
      puts "#{i[0]}|#{i[1]}|#{i[2]}"
      puts "--|--|--"
    end
  end
  # Checks if someone won
  def win?
    tikrinimai = [ [@signs[0][0], @signs[1][1], @signs[2][2]], [@signs[0][2], @signs[1][1], @signs[2][0]], @signs[0], @signs[1], @signs[2], @signs.collect{|i| i[0]}, @signs.collect{|i| i[1]}, @signs.collect{|i| i[2]}] 
    tikrinimai.each do |i|
      if i.same_values?
        self.draw
        return true
      end
    end
    false
  end

end

class Player
  attr_accessor :name, :sign
  def initialize
    puts "Player name:"
    @name = gets.chomp
  end
  
  def choose_position
    gets.chomp.split("")
  end

end

class Computer < Player
  def initialize
    puts "Hello, I'm friendly AI"
    @name = "Friend"
  end

  def choose_position
    (rand(1..3).to_s+rand(1..3).to_s).split("")
  end

end

game = Game.new

player_a = Player.new
player_b = game.secondplayer

players = game.player_array(player_a, player_b)
game.start(players)
game.play(players)