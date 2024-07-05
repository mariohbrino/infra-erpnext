.DEFAULT_GOAL = help

help: # Show a list of commands available.
	@echo "Show a list of commands available."
	@echo "usage: make <command>\n"
	@echo "Commands:\n"
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

setup: # Initial setup for infrastructure as code. [Initial set up and Ubuntu/Debian Based]
	@ansible-playbook -i playbooks/inventory.yml playbooks/setup.yml --extra-vars ansible_user=$$(id -nu) -K
	@ansible-galaxy collection install cloud.terraform

local: # Initial setup for local environment. [Initial set up and Ubuntu/Debian Based]
	@ansible-playbook -i playbooks/inventory.yml playbooks/local.yml --extra-vars ansible_user=$$(id -nu) -K

init: # Prepare your working directory for other command.
	@terraform -chdir=terraform init

settings: # Copy vagrant settings template files.
	@cp .env.example .env
	@cp servers.json.example servers.json
	@vagrant plugin install vagrant-env

key: # Create SSH key and save to ~/.ssh folder.
	@ssh-keygen -t ed25519 -C "erpnext" -f erpnext
	@mv erpnext* ~/.ssh
	@cat ~/.ssh/erpnext.pub

copy: # Copy terraform vars template. [Make sure to add your on private key on the variable]
	@cp terraform/erpnext.tfvars.example terraform/erpnext.tfvars

plan: # Show changes required by the current configuration.
	@terraform -chdir=terraform plan -var-file="erpnext.tfvars"

apply: # Create or update infrastructure.
	@terraform -chdir=terraform apply -var-file="erpnext.tfvars"

destroy: # Destroy previously-created infrastructure.
	@terraform -chdir=terraform destroy -var-file="erpnext.tfvars"

validate: # Check whether the configuration is valid.
	@terraform -chdir=terraform validate

format: # Reformat your configuration in the standard style.
	@terraform -chdir=terraform fmt .

inventory: # List the aws inventory.
	@ansible-inventory -i playbooks/terraform.yml --graph

provision: # Provision the aws erpnext instance.
	@ansible-playbook -i playbooks/terraform.yml playbooks/erpnext.yml
