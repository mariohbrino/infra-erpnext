# Deploy ERPNext

ERPNext is a free and open-source integrated Enterprise resource planning software developed by an Indian software company Frappe Technologies Pvt. Ltd. It is built on the MariaDB database system using Frappe, a Python based server-side framework.

> For more information about Frappe Framework check the link [here](https://frappeframework.com/docs).

## Initial Settings

Install necessary dependencies.
```bash
sudo apt -y install ansible make vagrant virtualbox
```

**Option**: install ansible via pip3, this will also install ansible-lint.
```bash
pip3 install ansible-dev-tools
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.profile
source ~/.profile
```

Configure AWS credentials.
```bash
aws configure --profile erpnext
```

## Provisioning with Terraform and Ansible

Create an SSH pair key. Then copy the `erpnext.pub` to `terraform/erpnext.tfvars`.
```bash
make copy           # Copy terraform vars template. [Make sure to add your on publick ssh key on the variable]
make key            # Create SSH key and save to ~/.ssh folder.
```

> Ansible requirement is version `>=2.15.0`.

Create the infrastrucure and provision on AWS.
```bash
make setup          # Initial setup for infrastructure as code. [Initial set up and Ubuntu/Debian Based]
make init           # Prepare your working directory for other command.
make plan           # Show changes required by the current configuration.
make apply          # Create or update infrastructure.
make inventory      # List the aws inventory.
make provision      # Provision the aws erpnext instance.
```

## Vagrant

Common commands to work witn vagrant.
```bash
make settings       # Copy vagrant settings template files.
vagrant up          # create, download and start virtual machine.
vagrant provision   # provision vagrant virtual machine.
vagrant status      # show status of virtual machines.
vagrant halt        # stop all virtual machines.
vagrant suspend     # suspend virtual machine.
vagrant resume      # resume virtual machine that is suspend.
vagrant ssh         # ssh into the given machine.
vagrant destroy -f  # force delete the virtual machine.
```

> Make sure to adjust the settings on `server.json` file for your environment.
