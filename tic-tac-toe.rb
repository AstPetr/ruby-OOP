class Board
	def initialize
		signs = []
	end 

	def assign_sign

	end

	def write
	end

	def win?
	end
end

class Player
	attr_accessor :name, :sign, :id

	def state
	end

end

game = Board.new
player_a = Player.new
player_b = Player.new
puts "Player 1 name:"
player_a.name = gets.chomp
player_a.id = 1
puts "PLayer 2 name"
player_b.name = gets.chomp
player_b.id = 2
# kuris eis pirmas
pirmas = rand(1..2)
puts pirmas



