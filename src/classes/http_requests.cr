# Class to handle requests
class Request
	def initialize(url : String)
		@url = url
	end

	def get_status
		client   			= HTTP::Client.new @url
		begin
			response   		= client.get "/"
			response_code = response.status_code
			client.close
		rescue
			return false
		else
			  if response_code >= 200 && response_code < 300
			  	return false
				else
					return true
			  end
		end
	end

	# Executes curl command to get Http redirects
	def get_redirect
		if !self.get_status
			return [] of String
		end

		command = "curl -L -v #{@url} --max-time 60"
		stdout	= IO::Memory.new
		stderr	= IO::Memory.new # curl prints to stderr
		process = Process.new(command: command, shell: true, output: stdout, error: stderr)
		process.wait()

		redirects = [] of String

		stderr.to_s.each_line do |line|
			matches = line.match(/\* Connected to (.*) \([0-9]/)
			if matches
				redirects << matches.captures[0].not_nil!
			end
		end
		redirects
	end
end
