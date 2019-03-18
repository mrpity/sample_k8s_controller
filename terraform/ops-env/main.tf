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
  vm_customize_host_name = "elastisearch-master-1"

  vm_cpu_resources = "2"
  vm_mem_resources = "2048"

  vm_disk_size_1 = "50"

  vm_customize_network_ip = "10.1.20.152"

  vsphere_server   = "${var.vsphere_server}"
  vsphere_user     = "${var.vsphere_user}"
  vsphere_password = "${var.vsphere_password}"
}

module "vsphere-vm-rke03" {
  source = "../custom-modules/create_vsphere_vm"

  vm_name                = "rke03.dev.whirl.sg"
  vm_customize_host_name = "elastisearch-master-2"

  vm_cpu_resources = "2"
  vm_mem_resources = "2048"

  vm_disk_size_1 = "50"

  vm_customize_network_ip = "10.1.20.153"

  vsphere_server   = "${var.vsphere_server}"
  vsphere_user     = "${var.vsphere_user}"
  vsphere_password = "${var.vsphere_password}"
}

module "vsphere-vm-rke04" {
  source = "../custom-modules/create_vsphere_vm"

  vm_name                = "rke04.dev.whirl.sg"
  vm_customize_host_name = "elastisearch-master-3"

  vm_cpu_resources = "2"
  vm_mem_resources = "2048"

  vm_disk_size_1 = "50"

  vm_customize_network_ip = "10.1.20.154"

  vsphere_server   = "${var.vsphere_server}"
  vsphere_user     = "${var.vsphere_user}"
  vsphere_password = "${var.vsphere_password}"
}

module "vsphere-vm-rke05" {
  source = "../custom-modules/create_vsphere_vm"

  vm_name                = "rke05.dev.whirl.sg"
  vm_customize_host_name = "elastisearch-data-1"

  vm_cpu_resources = "1"
  vm_mem_resources = "4096"

  vm_disk_size_1 = "50"

  vm_customize_network_ip = "10.1.20.155"

  vsphere_server   = "${var.vsphere_server}"
  vsphere_user     = "${var.vsphere_user}"
  vsphere_password = "${var.vsphere_password}"
}

module "vsphere-vm-rke06" {
  source = "../custom-modules/create_vsphere_vm"

  vm_name                = "rke06.dev.whirl.sg"
  vm_customize_host_name = "elastisearch-data-2"

  vm_cpu_resources = "1"
  vm_mem_resources = "4096"

  vm_disk_size_1 = "50"

  vm_customize_network_ip = "10.1.20.156"

  vsphere_server   = "${var.vsphere_server}"
  vsphere_user     = "${var.vsphere_user}"
  vsphere_password = "${var.vsphere_password}"
}

module "vsphere-vm-rke07" {
  source = "../custom-modules/create_vsphere_vm"

  vm_name                = "rke07.dev.whirl.sg"
  vm_customize_host_name = "elastisearch-data-3"

  vm_cpu_resources = "1"
  vm_mem_resources = "4096"

  vm_disk_size_1 = "50"

  vm_customize_network_ip = "10.1.20.157"

  vsphere_server   = "${var.vsphere_server}"
  vsphere_user     = "${var.vsphere_user}"
  vsphere_password = "${var.vsphere_password}"
}

module "vsphere-vm-rke08" {
  source = "../custom-modules/create_vsphere_vm"

  vm_name                = "rke08.dev.whirl.sg"
  vm_customize_host_name = "elastisearch-data-4"

  vm_cpu_resources = "1"
  vm_mem_resources = "4096"

  vm_disk_size_1 = "50"

  vm_customize_network_ip = "10.1.20.158"

  vsphere_server   = "${var.vsphere_server}"
  vsphere_user     = "${var.vsphere_user}"
  vsphere_password = "${var.vsphere_password}"
}

module "vsphere-vm-rke09" {
  source = "../custom-modules/create_vsphere_vm"

  vm_name                = "rke09.dev.whirl.sg"
  vm_customize_host_name = "elastisearch-data-5"

  vm_cpu_resources = "1"
  vm_mem_resources = "4096"

  vm_disk_size_1 = "50"

  vm_customize_network_ip = "10.1.20.159"

  vsphere_server   = "${var.vsphere_server}"
  vsphere_user     = "${var.vsphere_user}"
  vsphere_password = "${var.vsphere_password}"
}

module "vsphere-vm-rke10" {
  source = "../custom-modules/create_vsphere_vm"

  vm_name                = "rke10.dev.whirl.sg"
  vm_customize_host_name = "elastisearch-client-1"

  vm_cpu_resources = "3"
  vm_mem_resources = "2048"

  vm_disk_size_1 = "50"

  vm_customize_network_ip = "10.1.20.150"

  vsphere_server   = "${var.vsphere_server}"
  vsphere_user     = "${var.vsphere_user}"
  vsphere_password = "${var.vsphere_password}"
}

module "vsphere-vm-rke11" {
  source = "../custom-modules/create_vsphere_vm"

  vm_name                = "rke11.dev.whirl.sg"
  vm_customize_host_name = "elastisearch-client-2"

  vm_cpu_resources = "3"
  vm_mem_resources = "2048"

  vm_disk_size_1 = "50"

  vm_customize_network_ip = "10.1.20.149"

  vsphere_server   = "${var.vsphere_server}"
  vsphere_user     = "${var.vsphere_user}"
  vsphere_password = "${var.vsphere_password}"
}

module "vsphere-vm-rke12" {
  source = "../custom-modules/create_vsphere_vm"

  vm_name                = "rke12.dev.whirl.sg"
  vm_customize_host_name = "elastisearch-client-3"

  vm_cpu_resources = "3"
  vm_mem_resources = "2048"

  vm_disk_size_1 = "50"

  vm_customize_network_ip = "10.1.20.148"

  vsphere_server   = "${var.vsphere_server}"
  vsphere_user     = "${var.vsphere_user}"
  vsphere_password = "${var.vsphere_password}"
}
