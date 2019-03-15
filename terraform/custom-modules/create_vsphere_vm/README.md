#################################################
#Folder structure:
#################################################
main.tf --- main terraform file (primary entrypoint)
variables.tf --- variables for main terraform file
outputs.tf --- output of execution. Can be used for child modules (optional)
provider.tf --- list of terraform provider (in our case it's vsphere)

# optional files:
terraform.tfvars --- file with sensetive data. It will ignore by git, but terraform will use it
terraform.tfstate --- autocreated file with current env state (after applying main.tf, see below)
.terraform --- dir with plugins for terrform and etc (appear after initialization: terraform init)

#################################################
# First initializaion
#################################################
> terraform init

#################################################
# Get terraform plan of execution (validation..)
#################################################
> terraform plan

#################################################
# Apply plan
#################################################
> terraform apply

#################################################
# Rewrite default variables
#################################################
> terraform apply -var="vm_customize_network_ip=10.1.20.157"
