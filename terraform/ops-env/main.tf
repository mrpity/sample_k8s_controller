module "vsphere-vm-rke01" {
  source = "../custom-modules/create_vsphere_vm"

  vm_name                = "rke01.dev.whirl.sg"
  vm_customize_host_name = "elastisearch-performance"

  vm_cpu_resources = "4"
  vm_mem_resources = "4096"

  vm_disk_size_1 = "50"

  vm_customize_network_ip = "10.1.20.151"

  vsphere_server   = "${var.vsphere_server}"
  vsphere_user     = "${var.vsphere_user}"
  vsphere_password = "${var.vsphere_password}"
}

module "vsphere-vm-rke02" {
  source = "../custom-modules/create_vsphere_vm"

  vm_name                = "rke02.dev.whirl.sg"
  vm_customize_host_name = "elastisearch-2"

  vm_cpu_resources = "4"
  vm_mem_resources = "4096"

  vm_disk_size_1 = "50"

  vm_customize_network_ip = "10.1.20.152"

  vsphere_server   = "${var.vsphere_server}"
  vsphere_user     = "${var.vsphere_user}"
  vsphere_password = "${var.vsphere_password}"
}

module "vsphere-vm-rke03" {
  source = "../custom-modules/create_vsphere_vm"

  vm_name                = "rke03.dev.whirl.sg"
  vm_customize_host_name = "elastisearch-3"

  vm_cpu_resources = "4"
  vm_mem_resources = "4096"

  vm_disk_size_1 = "50"

  vm_customize_network_ip = "10.1.20.153"

  vsphere_server   = "${var.vsphere_server}"
  vsphere_user     = "${var.vsphere_user}"
  vsphere_password = "${var.vsphere_password}"
}

module "vsphere-vm-rke04" {
  source = "../custom-modules/create_vsphere_vm"

  vm_name                = "rke04.dev.whirl.sg"
  vm_customize_host_name = "elastisearch-4"

  vm_cpu_resources = "4"
  vm_mem_resources = "4096"

  vm_disk_size_1 = "50"

  vm_customize_network_ip = "10.1.20.154"

  vsphere_server   = "${var.vsphere_server}"
  vsphere_user     = "${var.vsphere_user}"
  vsphere_password = "${var.vsphere_password}"
}