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

#########################################
# Adjust settings
#########################################

variable "vsphere_vm_fodler" {
  type = "string"
  default = "/CustomerVM/WSEC"
}
variable "vm_name" {
  type = "string"
  default = "terraform-test"
}
variable "vm_cpu_resources" {
  type = "string"
  default = "1"
}
variable "vm_mem_resources" {
  type = "string"
  default = "1024"
}
variable "vm_disk_label" {
  type = "string"
  default = "disk0"
}
variable "vm_customize_host_name" {
  type = "string"
  default = "terraform-test"
}
variable "vm_customize_domain" {
  type = "string"
  default = "dev.whirl.sg"
}
variable "vm_customize_network_ip" {
  type = "string"
  default = "10.1.20.158"
}
variable "vm_customize_network_mask" {
  type = "string"
  default = "24"
}
variable "vm_customize_network_gateway" {
  type = "string"
  default = "10.1.20.1"
}
