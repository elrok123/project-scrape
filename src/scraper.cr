# Standard libs
#require "mysql"
#require "db"
require "mongo"
require "colorize"

# Custom classes
require "./classes/*"

mongo_factory = MxMongo.new("127.0.0.1", "domainUser", "168971", "27017", "admin")
domains_collection = mongo_factory.get_collection("domains")

class Combinator
	def initialize(tlds : Array(String), domains_collection : Mongo::Collection)
		@alphabet_arr = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
		@domains_collection = domains_collection
	end

	def get_permutations(length = 1)
		domain_permutations = [] of String
		("a".."z").to_a.each_permutation(length) do |permutation|
			
		end
		
	end

	def add(letters)
		
	end
end
combiner = Combinator.new(tlds)
(1..1000).each do |string_length|
	permutations = combiner.get_permutations(string_length, domains_collection)
	
end
