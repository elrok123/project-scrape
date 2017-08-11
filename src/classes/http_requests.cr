# Class to handle requests
class Request
	def initialize(url : String)
		@url = url
	end
	
	# Executes curl command to get Http redirects
	def get_redirect
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
