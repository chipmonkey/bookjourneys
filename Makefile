.PHONY:	help, dev-start

# takes advantage of the makefile structure (command; ## documentation)
# to generate help
help:  ## Print out this helpful little chart
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

dev-start:  ## Start local development environment
	cd client/bookjourneys && npm run dev

test:  ## Run all tests
	cd client/bookjourneys && npm run lint
