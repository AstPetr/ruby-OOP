class Mastermind
	def initialize
		@turns = 0
		@colors = ["red", "green", "blue", "yellow", "brown", "orange", "black", "white"]
		@game_master = nil
		@player_guess = []
		@answer = []
		puts "Objective: Guess 4 colors in 9 turns"
		puts @colors.join(" * ")
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
			@game_master = Computer.new(@colors)
		else
			player = Computer.new(@colors)
			@game_master = Human.new(true)
			puts "***************Computer guesses"
		end
		player
	end
	# Asks for answer
	def ask_for_answer
		@answer = @game_master.answer
		puts "--------------------------"
		puts @answer
		puts "--------------------------"
		return @answer
	end
    # Plays game until player wins or no more turns left
	def play(player)
		ask_for_answer
		until correct?
			if all_turns_used?
				puts "No more turns"
				exit
			end
			@player_guess = player.guess
			puts @game_master.hint(@player_guess)
			@turns +=1
		end
		puts "Correct!"
	end
    # Determines if guess is correct
	def correct?
		@player_guess == @answer
	end
end

class Master	
	attr_reader :answer
	# gives hint depending on players guess
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

class Human < Master
	
	def initialize(t=false)
		# @answer = choose_colors
		# @guess = choose_colors
		@colors = []
		if t == true
			@answer = generate_answer
		end
	end
    # Chooses colors for answer or guess
	def choose_colors
        4.times do |i|
			@colors[i] = gets.chomp
		end
		@colors
	end
    # Human player guess
	def guess
		puts "Guess:"
		choose_colors
	end

	def generate_answer
		puts "Choose colors:"
		choose_colors
		# ["green",  "black", "blue", "orange"]
	end
end

class Computer < Master
	
	def initialize(colors)
		@colors = colors
		@answer = generate_answer
	end
    # Chooses colors for answer
	def random
		colors = @colors.dup
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

	def guess
		guess = random
		puts guess
		guess
	end

	def generate_answer
		random
	end
    
end

game = Mastermind.new
player = game.assign_roles
game.play(player)

