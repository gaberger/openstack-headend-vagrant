output "Cloud ID Tag" {
  value = "${random_id.server.hex}"
}

output "Controller Type" {
  value = "${packet_device.infra.*.plan}"
}

output "Compute x86 Type" {
  value = "${packet_device.compute.*.plan}"
}

output "Infra IPs" {
  value = "${packet_device.infra.*.access_public_ipv4}"
}

output "Compute IPs" {
  value = "${packet_device.compute.*.access_public_ipv4}"
}

#output "Horizon dashboard via IP" {
#  value = "http://${packet_device.dashboard.access_public_ipv4}/horizon/ admin/ADMIN_PASS"
#}

#output "Controller SSH" {
#  value = "ssh root@${packet_device.infra.access_public_ipv4} -i ${var.cloud_ssh_key_path}"
#}

#output "Horizon dashboard via DNS" {
#  value = "http://${dnsimple_record.dashboard-dns.hostname}/horizon/ admin/ADMIN_PASS"
#}
#
#output "Controller SSH via DNS" {
#  value = "ssh root@${dnsimple_record.controller-dns.hostname} -i ${var.cloud_ssh_key_path}"
#}
