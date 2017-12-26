VERSION = 0.0.1

build:
	docker build -t $(USER)/mongrel-$(VERSION) ./

push:
	docker push $(USER)/mongrel-$(VERSION)

clean:
	docker rmi $(USER)/mongrel-$(VERSION)
