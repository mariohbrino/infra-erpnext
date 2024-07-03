# Deploy ERPNext

## Initial Settings

Install necessary dependencies.
```bash
sudo apt -y install ansible make vagrant virtualbox
```

Configure AWS credentials.
```bash
aws configure --profile erpnext
```

Create an SSH pair key. Then copy the `erpnext.pub` to `terraform/erpnext.tfvars`.
```bash
ssh-keygen -t ed25519 -C "erpnext" -f erpnext
mkdir ~/.ssh
mv erpnext* ~/.ssh
cat ~/.ssh/erpnext.pub
```

## Provisioning with Terraform and Ansible

Install terraform collection for ansible. To check more information access this [link](https://galaxy.ansible.com/ui/repo/published/cloud/terraform/).
```bash
ansible-galaxy collection install cloud.terraform
```

Create the infrastrucure and provision on AWS.
```bash
make setup          # Initial setup for infrastructure as code. [Initial set up and Ubuntu/Debian Based]
make init           # Prepare your working directory for other command.
make vars           # Copy template vars. [Make sure to add your on private key on the variable]
make plan           # Show changes required by the current configuration.
make apply          # Create or update infrastructure.
make inventory      # List the aws inventory.
make provision      # Provision the aws erpnext instance.
```

## Vagrant

Install vagrant-env plugin.
```bash
vagrant plugin install vagrant-env
```

Common commands to work witn vagrant.
```bash
make settings       # Copy vagrant settings template files.
vagrant up          # create, download and start virtual machine.
vagrant provision   # provision vagrant virtual machine.
vagrant status      # show status of virtual machines.
vagrant halt        
vagrant suspend     # suspend virtual machine.
vagrant resume      # resume virtual machine that is suspend.
vagrant ssh         # ssh into the given machine.
vagrant destroy -f  # force delete the virtual machine.
```

> Make sure to update the files 
