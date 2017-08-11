# Project Scrape

Project Scrape is an ambitious project a few of us came up with for fun, 
the idea spawned out of a simple algorithm to generate all combinations of
domain names possible. The idea grew into a project to scrape the entire web
for as many data forms as we could find use for. 

This project aims to create a hub of tools for people to use to scrape content 
of all forms, and possibly provide a useful platform for building a business
idea from.

We reserve the right to all code produced here except for libraries 2017.

## Installation

Simply download the repo using:

	git clone https://github.com/elrok123/project-scrape.git

And set the branch you wish to stem from with:

	git checkout -b <branchname>
	git pull origin <branchname>
Once you have the correct version of the repo, you may now build the application
using Crystal (if you already have Crystal installed, if not check out the 
dependencies section):

	crystal build (--release) ./src/scraper_tools -o project-scrape

Once the build is finished, you will have a binary in your CWD named 'project-scrape' 
but you may use any name you wish, just change the text proceeding '-o' parameter

## Dependencies
Project scrape requires a fair few pre-requisites before you will be able to build 
the application on your system, listed below are the libraries you require to build 
the application:

- libmongoc
- libxml
- openssl
- curl (along with libcurl and libcurl-dev)

Crystal lib dependencies:

- mongo 	(github: datanoise/mongo.cr)
- chalk_box (github: azukiapp/crystal-chalk-box)

## Usage
The binary itself has a few options, to get more information about these options
the binary provides:

	project-scrape -h

This parameter will print out the help information.

We are also able to view the version info by using:

	project-scrape --version

There are some tools to aid developers in debugging,
these tools are:

	project-scrape <my-command> -v -d

There are two parameters being used here '-v' is used
to show more information about the the run and '-d' is
used to display debug information that is not necessary to
be viewed when running a normal running, it is intended for
debugging system bugs.

There are also various commands we can use for running specific tools.
We have 'generate-domains', 'check-active domains' and 'scrape-all', these
all are used in the same way, but each tool provides different functionality,
allowing the user to stem multiple parts of the system from one executable binary.
The usage is as follows:

	project-scrape <command-to-specify-which-tool> (-v | -d | -h | --version | --help | --verbose | --debug)

## Development Tasks Left

- Scrape domains for media content
- Verify if domains are active
- Collect all domains that may be related and store in meaningful way
- Create frontend interface for viewing content

## Contributing

1. Fork it ( https://github.com/[your-github-name]/scraper/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [[elrok123]](https://github.com/[elrok123])  - Owner, creator, maintainer, developer
- [[obeidath]](https://github.com/[obeidath])  - Developer, maintainer


