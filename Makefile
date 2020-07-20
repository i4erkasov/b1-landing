####################
# LOCAL
####################

uid := $(shell id -u)
gid := $(shell id -g)

init: docker-down-clear docker-build docker-up web-init

docker-up:
	export uid=$(uid) gid=$(gid); \
	docker-compose -f ./docker-compose.yml up -d

docker-build:
	export uid=$(uid) gid=$(gid); \
	docker-compose -f ./docker-compose.yml build

docker-down-clear:
	export uid=$(uid) gid=$(gid); \
	docker-compose -f ./docker-compose.yml down -v --remove-orphans

web-dep-ensure:
	export uid=$(uid) gid=$(gid); \
	docker-compose -f ./docker-compose.yml run --rm web dep ensure --vendor-only

web-init: web-dep-ensure