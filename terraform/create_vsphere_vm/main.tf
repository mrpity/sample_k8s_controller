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
data "vsphere_datastore" "datastore" {
  name          = "${var.vsphere_datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_virtual_machine" "template" {
  name          = "${var.vsphere_virtual_machine_template}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_network" "network" {
  name          = "${var.vsphere_network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

########## EXAMPLE: Creating Resource Pool ###########
# data "vsphere_resource_pool" "mainpool" {
#   name          = "gc-cl-01/Resources/CustomerRP/"
#   datacenter_id = "${data.vsphere_datacenter.dc.id}"
# }

# resource "vsphere_resource_pool" "main" {
#   name          = "FIFA"
#   parent_resource_pool_id = "${data.vsphere_resource_pool.mainpool.id}"
# }
#######################################################

resource "vsphere_virtual_machine" "vm" {

  name             = "terraform-test"
  num_cpus         = 1
  memory           = 1024
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  guest_id         = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type        = "${data.vsphere_virtual_machine.template.scsi_type}"
  ###############################################################
  ## Important: Current user(Leeroy...) doesn't have permission 
  ## to create vm's without this option.
  folder           = "/CustomerVM/WSEC"
  ###############################################################

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }
  
  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
 
    customize {
      linux_options {
        host_name = "terraform-test"
        domain    = "dev.whirl.sg"
      }
      network_interface {
        ipv4_address = "10.1.20.158"
        ipv4_netmask = 24
      }
      ipv4_gateway = "10.1.20.1"
    }
  }

}