provider "packet" {
  auth_token = "${var.packet_auth_token}"

}

resource "random_id" "server" {
  byte_length = 8
}


resource "packet_device" "infrastructure" {
  hostname = "${format("infra-%02d", count.index)}"
  tags     = ["infra-${random_id.server.hex}"]

  count = "${var.packet_infra_count}"
  operating_system = "ubuntu_16_04"
  plan             = "${var.packet_infra_type}"
  connection {
    user = "root"
    private_key = "${file("${var.cloud_ssh_key_path}")}"
  }
  user_data     = "#cloud-config\n\nssh_authorized_keys:\n  - \"${file("${var.cloud_ssh_public_key_path}")}\""
  facility      = "${var.packet_facility}"
  project_id    = "${var.packet_project_id}"
  billing_cycle = "hourly"
  public_ipv4_subnet_size  = "29"

}


 resource "packet_device" "compute" {
   hostname = "${format("compute-%02d", count.index)}"
   tags     = ["compute-${random_id.server.hex} "]

   count = "${var.packet_compute_count}"

   operating_system = "ubuntu_16_04"
   plan             = "${var.packet_compute_type}"
   connection {
     user = "root"
     private_key = "${file("${var.cloud_ssh_key_path}")}"
   }
   user_data     = "#cloud-config\n\nssh_authorized_keys:\n  - \"${file("${var.cloud_ssh_public_key_path}")}\""
   facility      = "${var.packet_facility}"
   project_id    = "${var.packet_project_id}"
   billing_cycle = "hourly"
 }



