NOTE: We should update dns records before env creating! :(

#################################################
#Folder structure:
#################################################
main.tf --- main terraform file (primary entrypoint)

terraform.tfstate --- autocreated file with current env state (after applying main.tf, see below)
terraform.tfvars --- file with sensetive data. It will ignore by git, but terraform will use it
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
