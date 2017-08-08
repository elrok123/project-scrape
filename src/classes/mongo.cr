class MongoController
	@client : Mongo::Client | Nil
	# Initialise everything we need
	def initialize(host : String, username : String, password : String, port : String, database : String)
		self.connect(host, username, password, port, database)
	end
	
	# Connect to the database
	def connect(host : String, username : String, password : String, port : String, database : String)
		client = Mongo::Client.new "mongodb://#{username}:#{password}@#{host}:#{port}/#{database}"
		@client = client
		return client
	end

	# Get an instance of the database
	def get_instance
		if @client.not_nil!
			return @client
		else
			return nil
		end
	end

	# Method to check if we have a valid connection to the MongoDB
	def live?
		if @client.not_nil!
			begin
				if @client.not_nil!.command("domainInfo", {"connectionStatus" => 1}.to_bson).alive?
					return true
				else
					return false
				end
			rescue
				return false
			end
		else
			return false
		end
	end

	# Get an instance of a collection from MongoDB
	def get_collection(collection : String)
		if @client.not_nil! && collection.not_nil!
			return @client.not_nil!.collection("domainInfo", collection)
		else
			return nil
		end
	end
end
