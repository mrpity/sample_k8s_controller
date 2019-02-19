variable "vsphere_server" {}
variable "vsphere_user" {}
variable "vsphere_password" {}
 
variable "virtual_machine_dns_servers" {
  type    = "list"
  default = ["10.1.19.117", "10.1.19.118"]
}
