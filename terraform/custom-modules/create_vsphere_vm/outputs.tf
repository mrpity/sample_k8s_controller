output "iaac" {
  value = "vsphere"
}

output "vms" {
  value = "${element(concat(vsphere_virtual_machine.vm.*.name, list("")), 0)}"
}

output "vm_ip" {
  value = "${var.vm_customize_network_ip}"
}
