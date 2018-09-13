all: build

build:
	@docker build --tag=aspektr/postgresql .

release: build
	@docker build --tag=aspektr/postgresql:$(shell cat VERSION) .