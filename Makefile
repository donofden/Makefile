# To get the version of node npm yarn
NODE=$(shell which node)
NPM=$(shell which npm)
YARN=$(shell which yarn)

# To know the OS
OS := $(shell uname)

# To get Date Month Year using shell
DATE=$(shell date +%d)
MONTH=$(shell date +%m)
YEAR=$(shell date +%Y)

# This is to get a `jq` version from package.json
CURRENT_VERSION:=$(shell jq ".version" package.json)

.PHONY: explain
explain:
	### Welcome
	#  "Generate Text ASCII" from online for a good looking Makefile
	#	___  ___      _         __ _ _      
	#	|  \/  |     | |       / _(_) |     
	#	| .  . | __ _| | _____| |_ _| | ___ 
	#	| |\/| |/ _` | |/ / _ \  _| | |/ _ \	
	#	| |  | | (_| |   <  __/ | | | |  __/
	#	\_|  |_/\__,_|_|\_\___|_| |_|_|\___|
	#	                                 
	#	                                                                               
                                                        
	### HELP
	#
	# $$ make help
	#
	#
	#
	### Targets
	#
	@cat Makefile* | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
help: ## help to set up the project
	@echo
	@echo "Current version: $(CURRENT_VERSION)"
	@echo
	@echo "List of commands:"
	@echo
	@echo "  make info             - display node, npm and yarn versions... if not pls install the packages"
	@echo "  make install          - install npm"
	@echo "  make start            - start the serve/application."
	@echo "  make clean            - remove node modules"
	@echo "  "

info: ## Show if node, npm, yarn is installed
	@echo node version: `$(NODE) --version` "($(NODE))"
	@echo npm version: `$(NPM) --version` "($(NPM))"
	@echo yarn version: `$(YARN) --version` "($(YARN))"

.PHONY: install
install:  ## Makefile example for `make install` which will install all the following command
	pip3 install requests
	pip3 install jsonify
# Following is an example of how we can use OS related command in Makefile
# Install jq
ifeq ($(OS),Darwin)
	# Run MacOS commands
	brew install jq
else
	@echo "Currently we only support MacOS commands - Please install JQ."
endif

# This is one of the useful things we can do in makefile to wait for a command after execution
wait%:
	@echo
	@echo "A wait script was planted to overcome user creation errors.!"
	@echo "(\_/)"
	@echo "(o.o)"
	@echo "(___)0"
	sh wait.sh $*
# The wait can be triggered from here and a value can be sent
setup-db: wait60 ## To install and wait.
    echo "DONE! Waiting!!"
	
# Installation
clean: ## Clean the local filesystem
	git clean -fd

.PHONY: check-deps ## Checks if our dependencies are out of date
check-deps:
	composer.phar outdated
