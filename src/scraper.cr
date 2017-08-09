# Standard libs
#require "mysql"
#require "db"
require "mongo"
require "colorize"

# Custom classes
require "./classes/*"


class Combinator
	@domains_collection : Mongo::Collection | Nil
	def initialize(@tlds : Array(String))
		@alphabet_arr = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

		@mongo_factory = MongoController.new("127.0.0.1", "domainUser", "168971", "27017", "admin")
		@domains_collection = @mongo_factory.not_nil!.get_collection("domains")
	end

	def get_permutations(length = 1)
		unless @domains_collection.nil?
			domain_permutations = [] of String
			("a".."z").to_a.each_permutation(length) do |permutation|
				domain = permutation.join
				@tlds.each do |tld|
					begin
						puts "Attempting to add domain #{domain + tld}"
						self.add_domain(domain + tld)
					rescue 
						attempts = 4
						(0..attempts).each do |attempt|
							puts "There was a problem adding #{domain + tld}, retrying... Attempt no. #{attempt+1}"
							begin
								self.add_domain(domain + tld)
								puts "Successfully added #{domain + tld} after #{attempt+1} attempts..."
							rescue
								puts "Failed to add #{domain + tld} again... #{attempts - (attempt+1)} remaining..."
							else
								puts "Failed to add #{domain + tld} again... #{attempts - (attempt+1)} remaining..."
							end
						end
					end
				end
			end
		end
	end

	def add_domain(domain_to_add)
		@domains_collection.not_nil!.insert({"name" => domain_to_add }.to_bson)
		return true	
	end

	def add(letters)
		
	end
end
combiner = Combinator.new(TLDS)
(1..1000).each do |string_length|
	puts "Combining string length of #{string_length}..."
	permutations = combiner.get_permutations(string_length)
	puts "Finished combining strings of length #{string_length}"
end
