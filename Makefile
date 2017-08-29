build:          ## build normally
	docker build -t devbox .

build-no-cache: ## build without cache
	docker build --no-cache -t devbox .

help:           ## this help message
		@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
