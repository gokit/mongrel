VERSION = 0.0.1

build:
	docker build -t mongrel:$(VERSION) ./
	docker tag mongrel:$(VERSION) $(USER)/mongrel:$(VERSION)

push:
	docker push $(USER)/mongrel:$(VERSION)

clean:
	docker rmi $(USER)/mongrel:$(VERSION)
