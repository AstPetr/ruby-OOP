class Mastermind
	attr_reader :colors
	def initialize
		puts "Objective: Guess 4 colors in 9 turns"
		@turns = 1
		@colors = ["red", "green", "blue", "yellow", "brown", "orange", "black", "white"]
		@master = nil
		@player_guess = []
		@answer = []
	end
	# Checks if all turns there used
	def all_turns_used?
		if @turns == 12
			return true
		else
			return false
		end
	end
    # Determines who chooses and who guesses 
	def assign_roles
		puts "Do you want to guess? y/n"
		answ = gets.chomp
		if answ == "y"
			player = Human.new
			@master = Computer.new(@colors.dup)
		else
			player = Computer.new
			@master = Human.new
		end
		player
	end
	# Asks for answer
	def ask_for_answer
		@answer = @master.answer
	end
    # Plays game until player wins or no more turns left
	def play(player)
		ask_for_answer
		puts @colors.join(" * ")
		@player_guess = player.guess
		until correct?
			if all_turns_used?
				puts "No more turns"
				exit
			end
			puts @master.hint(@player_guess)
			@player_guess = player.guess
			@turns +=1
		end
		puts "Correct!"
	end
    # Determines if guess is correct
	def correct?
		@player_guess == @answer
	end
end

class Human
	attr_reader :answer
	def initialize
		@colors = []
	end
    # Chooses colors for answer
	def random

	end
    # gives gint depending on players guess
	def guess

	end
    # Human player guess
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
    # Chooses colors for answer
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
    # gives gint depending on players guess
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
player = game.assign_roles
game.play(player)

