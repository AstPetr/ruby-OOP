class Board
	def initialize
		@signs = []
	end 

	def random
		first = rand(2)
	end

	def start(player_a, player_b)
		puts "#{player_a.name} goes first"
		puts "#{player_a.name} choose sign"
		player_a.sign = gets.chomp
		puts "#{player_b.name} choose sign"
		player_b.sign = gets.chomp
		puts "Start game"
		self.write(player_a)
	end

	def write(player)
		while !win?
			place = gets.chomp.split("")
			@signs [place[0].to_i][place[1].to_i] = player.sign;
		end
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









