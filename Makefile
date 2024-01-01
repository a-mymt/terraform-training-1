export

TF_VAR_project_name := sincere-stack-406010

fmt:
	terraform fmt -recursive

validate:
	terraform validate

init:
	terraform init

plan:
	make fmt
	make validate
	terraform plan

apply:
	terraform apply

destroy:
	terraform destroy
