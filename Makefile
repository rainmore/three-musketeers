hello:
	docker compose -f ./examples/docker-compose-alpine.yml run --rm alpine echo 'Hello, World!'
.PHONY: hello

hello-clean:
	docker rmi alpine:latest
.PHONY: hello-clean
