VERSION = 0.0.2

all: build

build: build-stamp

build-stamp: Dockerfile mock-smtp.py Makefile
	docker build -t flaviovs/mock-smtp:$(VERSION) .
	docker tag flaviovs/mock-smtp:$(VERSION) flaviovs/mock-smtp:latest
	: > $@

push: build push-stamp

push-stamp: build-stamp
	docker push flaviovs/mock-smtp:$(VERSION)
	docker push flaviovs/mock-smtp:latest
	: > $@

clean:
	rm -f *~ *-stamp

.PHONY: all build push clean

