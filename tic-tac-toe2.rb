class Array
  def same_values?
    self.uniq.length == 1
  end
end

class Game
  def initialize
    @signs = [ ["11", "12", "13"], ["21", "22", "23"], ["31", "32", "33"] ]
  end 

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

  def start(players)
    puts "#{players[0].name} goes first, sign - x"
    players[0].sign = "x "
    puts "#{players[1].name} goes second, sign - o"
    players[1].sign = "o "
    puts "Start game"
  end

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

  def write(player)
    place = gets.chomp.split("")
    @signs[place[0].to_i-1][place[1].to_i-1] = player.sign
  end

  def draw
    @signs.each do |i|
      puts "#{i[0]}|#{i[1]}|#{i[2]}"
      puts "--|--|--"
    end
  end

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
  
end

game = Game.new
player_a = Player.new
player_b = Player.new
players = game.player_array(player_a, player_b)
game.start(players)
game.play(players)