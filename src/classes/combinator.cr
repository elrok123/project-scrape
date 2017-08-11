class Combinator
	@domains_collection : Mongo::Collection | Nil
	def initialize()
		@alphabet_arr = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

		@mongo_factory = MongoController.new("127.0.0.1", "domainUser", "168971", "27017", "admin")
		@domains_collection = @mongo_factory.not_nil!.get_collection("domains")
	end

	def get_permutations(length = 1)
		unless @domains_collection.nil?
			domain_permutations = [] of String
			("a".."z").to_a.each_permutation(length) do |permutation|
				domain = permutation.join
				begin
					puts "Attempting to add domain #{domain}"
					self.add_domain(domain)
				rescue 
					attempts = 4
					(0..attempts).each do |attempt|
						puts "There was a problem adding #{domain}, retrying... Attempt no. #{attempt+1}"
						begin
							self.add_domain(domain)
							puts "Successfully added #{domain} after #{attempt+1} attempts..."
						rescue
							puts "Failed to add #{domain} again... #{attempts - (attempt+1)} remaining..."
						else
							puts "Failed to add #{domain} again... #{attempts - (attempt+1)} remaining..."
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
end
