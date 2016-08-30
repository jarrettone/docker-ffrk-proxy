all: build

build:
	@docker build --tag=jdel/ffrk-proxy .

release: build
	@docker build --tag=jdel/ffrk-proxy:$(shell cat VERSION) .
