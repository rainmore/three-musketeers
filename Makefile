#!make
include local.env

## Initialise
init:
	echo '${TERRAFORM_ROOT_MODULE}'
	docker-compose -f ./docker-compose-terraform-utils.yml run --rm terraform-utils sh -c 'cd $(TERRAFORM_ROOT_MODULE); terraform init'
.PHONY: init

## Workspace
workspace:
	docker-compose -f ./docker-compose-terraform-utils.yml run --rm terraform-utils sh -c 'cd $(TERRAFORM_ROOT_MODULE); terraform workspace select $(TERRAFORM_WORKSPACE) || terraform workspace new $(TERRAFORM_WORKSPACE)'
.PHONY: workspace

## Plan
plan: init workspace
	docker-compose -f ./docker-compose-terraform-utils.yml run --rm terraform-utils sh -c 'cd ${TERRAFORM_ROOT_MODULE}; terraform plan'
.PHONY: plan

## Apply
apply: init workspace
	docker-compose -f ./docker-compose-terraform-utils.yml run --rm terraform-utils sh -c 'cd ${TERRAFORM_ROOT_MODULE}; terraform apply'
.PHONY: apply

## Destroy
destroy: init workspace
	docker-compose -f ./docker-compose-terraform-utils.yml run --rm terraform-utils sh -c 'cd ${TERRAFORM_ROOT_MODULE}; terraform destroy'
.PHONY: destroy

## Clean
clean:
	rm -rf .terraform
	rm -rf .terraform.tfstate.d
	rm -rf .terraform.lock.hcl
.PHONY: clean
