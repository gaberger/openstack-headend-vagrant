
variable "packet_auth_token" {
  description = "Your packet API key"
}

variable "packet_project_id" {
  description = "Packet Project ID"
}

variable "packet_facility" {
  description = "Packet facility: US East(ewr1), US West(sjc1), Tokyo (nrt1) or EU(ams1). Default: ewr1"
  default = "ewr1"
}

variable "packet_infra_type" {
  description = "Instance type of OpenStack controller"
  default = "baremetal_0"
}

variable "packet_compute_type" {
  description = "Instance type of OpenStack x86 compute nodes"
  default = "baremetal_0"
}

variable "packet_infra_count" {
  description = "Number of OpenStack Infra nodes"
  default = "4"
}

variable "packet_compute_count" {
  description = "Number of OpenStack x86 compute nodes to deploy"
  default = "2"
}

variable "cloud_ssh_public_key_path" {
  description = "Path to your public SSH key path"
  default = "./packet-key.pub"
}

variable "cloud_ssh_key_path" {
  description = "Path to your private SSH key for the project"
  default = "./packet-key"
}

variable "create_dns" {
  description = "If set to true, DNSSimple will be setup"
  default = false
}

