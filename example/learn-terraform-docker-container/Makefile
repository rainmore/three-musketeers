## Initialise
init:
	echo 'init terraform'
	# terraform init
	docker compose -f ./docker-compose-nginx.yml pull
.PHONY: init

## Apply
apply:
	echo 'apply terraform'
	# terraform apply -auto-approve
	docker compose -f ./docker-compose-nginx.yml up -d --force-recreate
	docker ps -n 1
.PHONY: apply

## Destory
destroy:
	echo 'destroy terraform'
	# terraform destroy -auto-approve
	docker compose -f ./docker-compose-nginx.yml down
.PHONY: destroy
