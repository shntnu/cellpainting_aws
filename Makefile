.DEFAULT_GOAL := push

.PHONY: apply
apply: get
	terraform apply

.PHONY: clean
clean:
	rm -rf .terraform

.PHONY: destroy
destroy:
	terraform destroy

.PHONY: get
get: pull
	terraform get

.PHONY: plan
plan: get
	terraform plan

.PHONY: pull
pull: remote
	terraform remote pull

.PHONY: push
push: apply
	terraform remote push

.PHONY: remote
remote: terraform
	terraform remote config -backend-config="bucket=cellpainting-terraform-state-development" -backend-config="key=terraform.tfstate" -backend=s3

terraform: terraform_0.8.4_linux_amd64.zip
	mkdir -p $@
	unzip $< -d $@

terraform_0.8.4_linux_amd64.zip:
	wget https://releases.hashicorp.com/terraform/0.8.4/$@
