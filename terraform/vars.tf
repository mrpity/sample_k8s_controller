variable "vsphere_server" {
    description = "vsphere server for the environment - EXAMPLE: vcenter01.hosted.local"
    default = "gc-vca-01.hpi.whirl.sg"
}
 
variable "vsphere_user" {
    description = "vsphere server for the environment - EXAMPLE: vsphereuser"
    default = "LeeroyJenkins@hpi.whirl.sg"
}
 
variable "vsphere_password" {
    description = "vsphere server password for the environment"
    default = "cPijdsa45#hnf)w"
}
 
variable "virtual_machine_dns_servers" {
  type    = "list"
  default = ["10.1.19.117", "10.1.19.118"]
}