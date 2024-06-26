
packer {
  required_plugins {
    digitalocean = {
      version = ">= 1.0.4"
      source  = "github.com/digitalocean/digitalocean"
    }
  }
}

variable "base_system_image" {
  type = string
}

variable "do_token" {
  type = string
}

variable "region" {
  type = string
}

variable "size" {
  type = string
}

variable "monitoring" {
  type = bool
}

variable "snapshot_name" {
  type = string
}

variable "droplet_name" {
  type = string
}

variable "ssh_private_key_file" {
  type = string
}

variable "ipv6" {
  type = bool
}

variable "private_networking" {
  type = bool
}

source "digitalocean" "autogenerated" {
  api_token    = "${var.do_token}"
  image        = "${var.base_system_image}"
  region       = "${var.region}"
  size         = "${var.size}"
  ssh_username = "root"
  snapshot_name   = "${var.snapshot_name}"
  monitoring   = "${var.monitoring}"
  ipv6         = "${var.ipv6}"
  droplet_name         = "${var.droplet_name}"
  ssh_private_key_file = "${var.ssh_private_key_file}"
  private_networking = "${var.private_networking}"
  user_data_file = "/home/chris/setup-servers/packer/secured_folder/cloud-config"
}

build {
  sources = ["source.digitalocean.autogenerated"]

  provisioner "shell" {
    scripts = [
      "/home/chris/setup-servers/packer/scripts/python_install.sh"
    ]
  }

  provisioner "ansible" {
    playbook_file = "../ansible/playbooks/apt.yml"
  }

}
