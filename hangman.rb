class Hangman
	attr_accessor :name, :guessed, :correct_blank, :counter
	def initialize(hangman_name)
		@name = hangman_name.upcase
		@guessed = []
		@correct_blank = blank
		@counter = 9
	end


	def name_count
		name.length
	end
	def make_move(letter)
		if correct_letter?(letter)
			correct_index(letter)
		else
			@counter-=1
		end
	end

	def correct_letter?(letter)
		name.include?(letter)
	end
	def update_guessed(choice)
		guessed.push(choice)
	end
	def verify_guessed(letter)
		guessed.include(letter)
	end
	def blank
		Array.new(name_count,"_")
	end
	def correct_letter(letter)
		password=name.split("")
	end
	def correct_index(guessletter)
		password=name.split("")
		password.each_with_index do |letter,index_position|
			if letter == guessletter
				correct_blank[index_position] = guessletter
				
			end

		end	

	end
	def available_guessed(choice)
		if guessed.count(choice) == 0
			true
		else
			false

		end
	end
	def failure
		counter == 0
	end
	def winner
		if correct_blank.include?("_")
			false
			else
			true
		end
	end
end


