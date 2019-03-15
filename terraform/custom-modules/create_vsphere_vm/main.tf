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

resource "vsphere_virtual_machine" "vm" {
  name             = "${var.vm_name}"
  num_cpus         = "${var.vm_cpu_resources}"
  memory           = "${var.vm_mem_resources}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  guest_id         = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type        = "${data.vsphere_virtual_machine.template.scsi_type}"
  folder           = "${var.vsphere_vm_folder}"

  #user_data        = "${file("${path.module}/scripts/ssm-resize.sh")}"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }
  disk {
    label            = "${var.vm_disk_label}"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }
  disk {
    label       = "${var.vm_disk_label_1}"
    size        = "${var.vm_disk_size_1}"
    unit_number = "${var.vm_disk_unit_number_1}"
  }
  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${var.vm_customize_host_name}"
        domain    = "${var.vm_customize_domain}"
      }

      network_interface {
        ipv4_address    = "${var.vm_customize_network_ip}"
        ipv4_netmask    = "${var.vm_customize_network_mask}"
        dns_server_list = "${var.virtual_machine_dns_servers}"
      }

      ipv4_gateway = "${var.vm_customize_network_gateway}"
    }
  }
}
