class Mastermind
	attr_reader :colors
	def initialize
		puts "Objective: Guess 4 colors in 9 turns"
		@turns = 1
		@colors = ["red", "green", "blue", "yellow", "brown", "orange", "black", "white"]
		@computer = Computer.new(@colors.dup)
		@player_guess = []
	end
	# Checks if all turns there used
	def all_turns_used?
		if @turns == 12
			return true
		else
			return false
		end
	end
    
	def assign_roles

	end

	def play(player)
		puts @colors.join(" * ")
		@player_guess = player.guess
		until correct?
			if all_turns_used?
				puts "No more turns"
				exit
			end
			puts @computer.hint(@player_guess)
			@player_guess = player.guess
			@turns +=1
		end
		puts "Correct!"
	end

	def correct?
		@player_guess == @computer.answer
	end
end

class Player
	def initialize
		@colors = []
	end

	def guess
		4.times do |i|
			@colors[i] = gets.chomp
		end
		@colors
	end
end

class Computer
	attr_reader :answer
	def initialize(colors)
		puts "--------------------------"
		puts @answer = random(colors)
		puts "--------------------------"
	end

	def random(colors)
		k = 0
		rand_colors = []
		4.times do |i|
			r = rand(8-k)
			rand_colors[i] = colors[r]
			colors.delete_at(r)
			k +=1
		end
		rand_colors
	end

	def hint(guess)
		correct_place = 0
		equal = @answer & guess
		if !equal.empty?
			equal.each do |i|
				if @answer.index(i) == guess.index(i)
					correct_place += 1
				end
			end			
		 	return "#{equal.length} correct colors, #{correct_place} correct places"
		else
		 	return "Incorrect! Guess again."
		end 
	end
end

game = Mastermind.new
player = Player.new
game.play(player)

