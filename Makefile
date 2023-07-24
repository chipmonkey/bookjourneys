.PHONY:	help, dev-start

# takes advantage of the makefile structure (command; ## documentation)
# to generate help
help:  ## Print out this helpful little chart
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

dev-rebuild:  ## Build containers for local environment
	docker-compose -f ./containers/dev-compose.yml up -d --build --remove-orphans

dev-start:  ## Start local development environment
	docker-compose -f ./containers/dev-compose.yml up -d --no-recreate

dev-stop:  ## Stop the presses!
	docker-compose -f ./containers/dev-compose.yml down

test: dev-start  ## Run all tests
	docker exec -t containers-client-1 bash -c "cd /home/node/app && npm run lint"
