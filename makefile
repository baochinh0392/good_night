.PHONY: help
.DEFAULT_GOAL := help

#COLORS
GREEN  := $(shell tput -Txterm setaf 2)
WHITE  := $(shell tput -Txterm setaf 7)
YELLOW := $(shell tput -Txterm setaf 3)
RESET  := $(shell tput -Txterm sgr0)

# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'
# A category can be added with @category
HELP_FUN = \
    %help; \
    while(<>) { push @{$$help{$$2 // 'options'}}, [$$1, $$3] if /^([a-zA-Z\-_]+)\s*:.*\#\#(?:@([a-zA-Z\-]+))?\s(.*)$$/ }; \
    print "usage: make [target]\n\n"; \
    for (sort keys %help) { \
    print "${WHITE}$$_:${RESET}\n"; \
    for (@{$$help{$$_}}) { \
    $$sep = " " x (32 - length $$_->[0]); \
    print "  ${YELLOW}$$_->[0]${RESET}$$sep${GREEN}$$_->[1]${RESET}\n"; \
    }; \
    print "\n"; }

help: ##@other Show this help.
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)
up: ##@docker Start project
	@docker-compose up -d
stop: ##@docker Stop project
	@docker-compose stop
start: ##@docker Start project
	@docker-compose start
restart: ##@docker Restart project
	@docker-compose restart
bash: ##@docker Open bash project
	@docker-compose exec web bash
console: ##@docker Open bash project
	@docker-compose exec web bundle exec rails c
server: ##@docker Open server project
	@docker-compose exec web bundle exec rails s -b 0.0.0.0
setdb_env: ##@docker Set environment database
	@docker-compose exec web bundle exec rails db:environment:set RAILS_ENV=development
reset_db: ##@docker Reset database project to default
	@docker-compose exec web bundle exec rails db:drop db:create db:migrate db:seed
migrate: ##@docker Run migration
	@docker-compose exec web bundle exec rails db:migrate
seed: ##@docker Run default data
	@docker-compose exec web bundle exec rails db:seed
rspec: ##@docker Run rspec
	@docker-compose exec web bundle exec rspec spec
rswag: ##@docker Run swagger
	@docker-compose exec web bundle exec rake rswag:specs:swaggerize