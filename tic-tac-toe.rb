class Array
  def same_values?
    self.uniq.length == 1
  end
end

class Board
  def initialize
    @signs = [ ["11", "12", "13"], ["21", "22", "23"], ["31", "32", "33"] ]
  end 

  def start(player_a, player_b)
    puts "#{player_a.name} goes first, sign - x"
    player_a.sign = "x "
    puts "#{player_b.name} goes second, sign - o"
    player_b.sign = "o "
    puts "Start game"
    self.play(player_a, player_b)
  end

  def play(player_a, player_b)
    while !win?
      if self.input_ok?(player_a)
        self.draw
        puts "#{player_a.name} turn"
        self.write(player_a)
      end
      if self.input_ok?(player_b) && !win?
        self.draw
        puts "#{player_b.name} turn"
        self.write(player_b)
      end
    end
  end

  def random_player
    first = rand(2)
  end

  def input_ok?(player)
    true
  end

  def write(player)
    place = gets.chomp.split("")
    @signs[place[0].to_i-1][place[1].to_i-1] = player.sign;
     #Cia bus lentele puts @signs
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
  attr_accessor :name, :sign, :id

  def first?(first)
    self.id == first
  end

end

game = Board.new
player_a = Player.new
player_b = Player.new
puts "Player 1 name:"
player_a.name = gets.chomp
player_a.id = 0
puts "Player 2 name"
player_b.name = gets.chomp
player_b.id = 1
# kuris eis pirmas
first = game.random_player
# puts first
if player_a.first?(first)
  game.start(player_a, player_b)
elsif player_b.first?(first)   #nebutina bet del viso pikto
  game.start(player_b, player_a)
end









