BASE := $(shell /bin/pwd)
TF ?= terraform
AWS ?= aws


export ENV=prod
export AWS_PROFILE=app_deployment_${ENV}

target:
	$(info ${HELP_MESSAGE})
	@exit 0

create-stack:
	$(info [*] Create Infrastructure using AWS CLI)
	@$(AWS) cloudformation create-stack --stack-name terraform-infrastructure --template-body file://cloudformation/infrastructure.yaml

init:
	$(info [*] Terraform Init)
	@$(TF) init -reconfigure -backend-config=settings/${ENV}/backend.conf

plan:
	$(info [*] Terraform Plan )
	@$(TF) plan -var-file=settings/${ENV}/variables.tfvars -out tfplan

apply:
	$(info [*] Terraform Apply )
	@$(TF) apply -auto-approve tfplan

deploy:
	@$(MAKE) init
	@$(MAKE) plan
	@$(MAKE) apply

destroy:
	@$(MAKE) init
	@$(TF) plan -destroy -out tfplan
	@$(MAKE) apply

#############
#  Helpers  #
#############


define HELP_MESSAGE
	Environment variables to be aware of or to hardcode depending on your use case:

	Common usage:

	...::: Terraform Init :::...
	$ make init

    ...::: Terraform Plan :::...	
    $ make plan

    ...::: Terraform Apply :::...
	$ make apply

	...::: Terraform Init, Plan, and Apply :::...
	$ make deploy

	...::: Terraform Apply an Destroy Plan :::...
	$ make destroy
endef