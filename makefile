BASE := $(shell /bin/pwd)
TF ?= terraform

target:
	$(info ${HELP_MESSAGE})
	@exit 0

init:
	$(info [*] Terraform Init)
	@$(TF) init

plan:
	$(info [*] Terraform Plan )
	@$(TF) plan -out tfplan

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