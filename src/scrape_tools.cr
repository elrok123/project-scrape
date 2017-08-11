# Standard libs
#require "mysql"
#require "db"
require "mongo"
require "colorize"

# Custom classes
require "./classes/mongo.cr"
require "./classes/option_parser.cr"
require "./classes/combinator.cr"

options = OptionParser.new.get_options

combiner = Combinator.new

case options[:tool]
when :generate_domains
	(1..1000).each do |string_length|
		puts "Combining string length of #{string_length}..."
		combiner.get_permutations(string_length)
		puts "Finished combining strings of length #{string_length}"
	end
when :check_active_domains
	# Start checking active domains from here
when :scrape_all
	# Start scraping sequence from here
end
