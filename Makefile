HTTP_PROXY_ARGS = 
ifdef http_proxy
	HTTP_PROXY_ARGS = "http_proxy=${http_proxy}"
endif

ifdef https_proxy
	HTTPS_PROXY_ARGS = "https_proxy=${https_proxy}"
endif

all: build
build:
	@docker build --build-arg ${HTTP_PROXY_ARGS} --build-arg ${HTTPS_PROXY_ARGS} --tag=nsomeya/docker-gitlab-ci-multi-runner .

release: build
	@docker build --build-arg ${HTTP_PROXY_ARGS} --build-arg ${HTTPS_PROXY_ARGS} --tag=nsomeya/docker-gitlab-ci-multi-runner:$(shell cat VERSION) .
