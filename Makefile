.PHONY: help


PORT:=8080
APP_NAME:=angry_harry
TAG:=0.0.1

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

build: ## Build image using Dockerfile with given TAG default is TAG:=0.0.1 if not given(Auto Versioning will be added later)
	docker build -t nginx_as_file_store:$(TAG) .

run: stop ## Run container on PORT APP_NAME if not specified defaults are PORT:=8080 APP_NAME:=angry_harry
	docker run -i -t --rm --name $(APP_NAME) -p=$(PORT):8080 nginx_as_file_store:$(TAG)

stop: ## Stop running containers
	docker stop $(APP_NAME) || true
