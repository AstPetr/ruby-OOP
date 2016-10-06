require 'matrix'
class Matrix
  def []=(row, column, value)
    @rows[row][column] = value
  end
end

class Board
	def initialize
		@signs = Matrix[ ["a", "b", "c"], ["d", "e", "f"], ["i", "j", "k"] ]
	end 

	def start(player_a, player_b)
		puts "#{player_a.name} goes first"
		puts "#{player_a.name} choose sign"
		player_a.sign = gets.chomp
		puts "#{player_b.name} choose sign"
		player_b.sign = gets.chomp
		puts "Start game"
		self.play(player_a, player_b)
	end

	def play(player_a, player_b)
		while !win?
			if self.input_ok?(player_a)
				puts "#{player_a.name} turn"
				self.write(player_a)
			end
			if self.input_ok?(player_b) && !win?
				puts "#{player_b.name} turn"
				self.write(player_b)
			end
		end
	end

	def random
		first = rand(2)
	end

	def input_ok?(player)
		true
	end

	def write(player)
			place = gets.chomp.split("")
			@signs[place[0].to_i-1, place[1].to_i-1] = player.sign;
			puts @signs
	end

	def win?
		false
	end

end

class Player
	attr_accessor :name, :sign, :id

	def initialize

	end

	def state
	end

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
first = game.random
# puts first
if player_a.first?(first)
	game.start(player_a, player_b)
elsif player_b.first?(first)   #nebutina bet del viso pikto
	game.start(player_b, player_a)
end









