# Standard libs
#require "mysql"
#require "db"
require "mongo"
require "colorize"

# Custom classes
require "./classes/mongo.cr"
require "./classes/option_parser.cr"

options = MxOptionParser.new.get_options

combiner = Combinator.new

(1..1000).each do |string_length|
	puts "Combining string length of #{string_length}..."
	combiner.get_permutations(string_length)
	puts "Finished combining strings of length #{string_length}"
end
