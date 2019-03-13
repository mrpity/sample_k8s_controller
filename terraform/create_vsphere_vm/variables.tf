variable "vsphere_server" {}
variable "vsphere_user" {}
variable "vsphere_password" {}
 
variable "vsphere_datacenter" {
  type = "string"
  default = "gc-dc-01"
}

variable "vsphere_datastore" {
  type = "string"
  default = "ES_E2824_LUN1"
}
variable "vsphere_resource_pool" {
  type = "string"
  default = "gc-cl-01/Resources/CustomerRP/WSEC_General_Test_RP"
}

variable "vsphere_virtual_machine_template" {
  type = "string"
  default = "CustomerVM/WSEC/wsec_k8s_tmplt"
}

variable "vsphere_network" {
  type = "string"
  default = "vds01-pg020"
}


variable "virtual_machine_dns_servers" {
  type    = "list"
  default = ["10.1.19.117", "10.1.19.118"]
}
