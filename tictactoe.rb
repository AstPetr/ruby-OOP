class Board
	def initialize
		arr = []
		players[player_a] = :playing
		players[player_b] = :playing
	end 

	def write_board
	end

	def player_state
	end

	def won?
	end
end

class Player
	attr_accessor :name

end

player_a = Player.new
player_b = Player.new
puts "Player 1 name:"
player_a.name = gets.chomp
puts "PLayer 2 name"
player_b.name = gets.chomp

puts playerb.name


