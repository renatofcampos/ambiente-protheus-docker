VERSION = v20220823
NAME = $(whoami)/protheus-docker

.PHONY: all
all: build

.PHONY: build
build:
	docker image build -t $(NAME):$(VERSION) --rm . rootfs

.PHONY: tag_latest
tag_latest:
	docker image tag $(NAME):$(VERSION) $(NAME):latest

.PHONY: release
release:
	docker image push $(NAME):$(VERSION)
	docker image push $(NAME):latest
