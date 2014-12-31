class Evaluator
	attr_reader :printer,
							:game_in_progress

	attr_accessor :number

	def initialize(printer)
		@printer = printer
		@game_in_progress = false
	end

	def execute(input)
		if !game_in_progress
			game_menu(input)
		else
			play_game(input)
		end
	end

	def game_menu(input)
		if input == 'p'
			@number = rand(1..5)
			@game_in_progress = true
			[printer.take_guess, :continue]
		elsif input == 'q'
			[printer.quit_game, :stop]
		end
	end

	def play_game(input)
		if input == 'q'
			@game_in_progress = false
			return [printer.end_round, :continue]
		end
		guess = input.to_i
		if too_high?(guess)
			[printer.too_high, :continue]
		elsif too_low?(guess)
			[printer.too_low, :continue]
		elsif correct?(guess)
			@game_in_progress = false
			[printer.correct_guess, :continue]
		end
	end

	def too_high?(guess)
		guess > number
	end

	def too_low?(guess)
		guess < number
	end

	def correct?(guess)
		guess == number
	end
end
