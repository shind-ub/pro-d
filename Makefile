IMAGE_NAME=pro-d
IMAGE_TAG:=$(shell git rev-parse HEAD)
WORKDIR=opt/app

.PHONY: build-pipeline
build:
	@docker build --cache-from $(IMAGE_NAME):latest \
		-t $(IMAGE_NAME):latest \
		-t $(IMAGE_NAME):$(IMAGE_TAG) . -f Dockerfile

.PHONY: notebook
notebook:
	WORKDIR=$(WORKDIR) \
	docker run --rm \
		-p 8888:8888 \
		-v $(shell PWD)/data:/$(WORKDIR)/data \
		-v $(shell PWD)/notebooks:/$(WORKDIR)/notebooks \
		$(IMAGE_NAME) jupyter notebook --ip=0.0.0.0 --allow-root .