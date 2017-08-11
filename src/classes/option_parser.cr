class OptionParser

	@verbose : Bool
	@debug   : Bool
	@help    : Bool | Nil
	@generate_domains : String | Bool | Nil
	@tool : Bool | Symbol

	def initialize
		@option_struct = Hash(String, (String | Bool)).new

		# All optional params should be listed in either @arg_keywords or @arg_keychars, one for the full length param and one for the singe character flags (respectively)
		@arg_keywords = ["generate-domains", "check-active-domains", "scrape-all", "--debug", "--help", "--verbose", "--account", "--version"]
		@arg_keychars = ["-d", "-h", "-v"]
		
		# Set up our default vars
		@verbose = false
		@debug = false
		@help = false
		@generate_domains = false
		@tool = false

		self.parse_options	
	end
	def parse_options
		# Simple algorithm to parse our arguments
		ARGV.each_with_index do |arg, i|
			if @arg_keywords.includes?(arg) || @arg_keychars.includes?(arg)
				if arg.includes?("-")
					@option_struct[arg] = true
				else
					if ARGV.size >= i+2 
						unless ARGV[i+1].includes? "-"
							@option_struct[arg] = ARGV[i+1]
						end
					end	
				end
				
				
			end
		end
		self.set_conditions
	end
	def set_conditions
		if (@option_struct.keys - (@arg_keywords+@arg_keychars)).size > 0
			puts "Some wrong args"
		end

		# Check if we want to enable debug mode
		if @option_struct.keys.includes?("-d") || @option_struct.keys.includes?("--debug")
			@debug = true
		else
			@debug = false
		end
		# Check if we want to enable verbose mode
		if (@option_struct.keys.includes?("-v") || @option_struct.keys.includes?("--verbose"))
			@verbose = true
		else
			@verbose = false
		end
		# Check if we want to show the help information
		if @option_struct.keys.includes?("--version")
			self.show_version
			exit 0
		else
			@version = false
		end
		# Check if we want to show the help information
		if (@option_struct.keys.includes?("-h") || @option_struct.keys.includes?("--help"))
			self.show_help
			exit 0
		else
			@help = false
		end
		# Check if we want to use a specified account
		if @option_struct.keys.includes?("generate-domains")
			@tool = :generate_domains
		elsif @option_struct.keys.includes?("check-active-domains")
			@tool = :check_active_domains
		elsif @option_struct.keys.includes?("scrape-all")
			@tool = :scrape_all
		end
	end
	def get_options
		return {
			verbose: @verbose,
			debug: @debug,
			help: @help,
			tool: @tool
		}
	end
	def show_version
		puts <<-VERSIONTEXT
			ProjectScrape: a tool created to crawl the web for media forms
			Overly ambitious and ridiculously complex, just how we like it.
			Developed by elrok123 and obeidath for personal use V1.0.
		VERSIONTEXT
	end
	def show_help
		puts <<-HELPTEXT
		MxMongo Usage instructions:
			mxmongo -d 				| --debug
			mxmongo -h 				| --help
			mxmongo -v 				| --verbose
			mxmongo -a <account-id> | --account <account-id>
			mxmongo --version
		HELPTEXT
	end

end
