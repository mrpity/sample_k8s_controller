module "vsphere-vm-rke06" {
  source = "${path.module}/custom-modules/create_vsphere_vm"

  vm_name                = "elastisearch-performance"
  vm_customize_host_name = "elastisearch-performance"

  vm_cpu_resources = "4"
  vm_mem_resources = "4096"

  vm_disk_size_1 = "50"

  vm_customize_network_ip = "10.1.20.158"
}
