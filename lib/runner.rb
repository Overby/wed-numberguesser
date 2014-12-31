require_relative 'printer'
require_relative 'evaluator'

printer   = Printer.new
evaluator = Evaluator.new(printer)

puts printer.welcome_message

signal = :continue

until signal == :stop
	input = gets.chomp
	message, signal = evaluator.execute(input)
	puts message
end
