provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"

  # If you have a self-signed cert
   allow_unverified_ssl = true
}
data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_datacenter}"
}
data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

# data "vsphere_resource_pool" "mainpool" {
#   name          = "gc-cl-01/Resources/CustomerRP/"
#   datacenter_id = "${data.vsphere_datacenter.dc.id}"
# }

# resource "vsphere_resource_pool" "main" {
#   name          = "FIFA"
#   parent_resource_pool_id = "${data.vsphere_resource_pool.mainpool.id}"
# }
